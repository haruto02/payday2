local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.Anticrash = _G.Anticrash or {}
Anticrash._path = ModPath
Anticrash._data_path = SavePath .. 'anticrash.txt'
Anticrash.action_types = {
	'default',
	'unprotected',
	'quiet',
	'chat',
	'kick',
	'ban',
}
Anticrash.action_ranks = {}
for rank, action in ipairs(Anticrash.action_types) do
	Anticrash.action_ranks[action] = rank
end
Anticrash.settings = {
	anticrash_default_action = 'chat',
}
Anticrash.default_specials = {
	anim_cbk_spawn_melee_item = 'kick',
	anim_clbk_spawn_dropped_magazine = 'kick',
	['player_action_walk_nav_point (manual)'] = 'kick',
	['set_stance (manual)'] = 'kick',
}
Anticrash.objects = {
	ConnectionNetworkHandler = {},
	UnitNetworkHandler = {
		protect_spawn = {
			request_throw_projectile = true,
			sync_throw_projectile = true,
		}
	}
}

dofile(ModPath .. 'lua/text_fields.lua')
dofile(ModPath .. 'lua/cleaners.lua')

function Anticrash:load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all'))) do
			self.settings[k] = v == 'nothing' and 'quiet' or v
		end
		file:close()
	else
		self.settings = {
			anticrash_default_action = 'chat',
			damage_fire = 'kick',
			player_action_walk_nav_point = 'unprotected',
			request_throw_projectile = 'kick',
			set_stance = 'unprotected',
			suppression = 'unprotected',
			sync_throw_projectile = 'kick',
		}
		for source, default_value in pairs(self.default_specials) do
			self.settings[source] = default_value
		end
	end
end

function Anticrash:save()
	for k, v in pairs(self.settings) do
		if v == 'default' then
			self.settings[k] = nil
		end
	end

	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function Anticrash:get_all_sources()
	if self.sources then
		return self.sources
	end

	self.sources = {}

	for source in pairs(self.default_specials) do
		self.sources[source] = true
	end

	for object_name in pairs(self.objects) do
		local object = _G[object_name]
		for n, f in pairs(object) do
			if type(f) == 'function' and n ~= 'new' then
				Anticrash.sources[n] = true
			end
		end
	end

	return self.sources
end

function Anticrash:take_action_against_peer(peer, source)
	if not source then
		log(debug.traceback())
		return
	end

	local action = self.settings[source] or self.settings.anticrash_default_action
	local message_id = 0

	if action == 'ban' or action == 'kick' then
		if peer and peer == managers.network:session():local_peer() then
			log('[Anticrash] action overridden: peer is local player')
			action = 'chat'
		end
	end

	if action == 'ban' then
		if peer and not managers.ban_list:banned(peer:user_id()) then
			managers.ban_list:ban(peer:user_id(), peer:name())
		end
		action = 'kick'
		message_id = 6
	end

	if action == 'kick' then
		if peer and Network:is_server() then
			managers.network:session():send_to_peers('kick_peer', peer:id(), message_id)
			managers.network:session():on_peer_kicked(peer, peer:id(), message_id)
		end
		action = 'chat'
	end

	if action == 'chat' then
		self:send_to_chat(peer, source)
	end
end

function Anticrash:send_to_chat(peer, source)
	local message = managers.localization:text('anticrash_crash_prevented', { SOURCE = source })
	if peer then
		message = message .. managers.localization:text('anticrash_crash_coming_from', { NAME = peer:name() })
	end
	if managers.chat then
		managers.chat:_receive_message(ChatManager.GAME, managers.localization:text('anticrash_options_menu_title'), message, tweak_data.system_chat_color)
	end
end

function Anticrash:sanitize_weapon(factory_id, blueprint, patch_source)
	local new_blueprint = table.deep_map_copy(managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id))

	local i, changed = 0
	repeat
		i = i + 1
		changed = false
		for _, part_id in ipairs(blueprint) do
			if not table.contains(new_blueprint, part_id) then
				managers.weapon_factory:change_part_blueprint_only(factory_id, part_id, new_blueprint)
				changed = true
			end
		end
	until not changed or i > 5

	if i > 1 and patch_source then
		for i = #blueprint, 1, -1 do
			blueprint[i] = nil
		end
		for _, part_id in ipairs(new_blueprint) do
			table.insert(blueprint, part_id)
		end
		return blueprint
	else
		return new_blueprint
	end
end

Hooks:Add('LocalizationManagerPostInit', 'LocalizationManagerPostInit_Anticrash', function(loc)
	local language_filename

	for _, filename in pairs(file.GetFiles(Anticrash._path .. 'loc/')) do
		local str = filename:match('^(.*).txt$')
		if str and Idstring(str) and Idstring(str):key() == SystemInfo:language():key() then
			language_filename = filename
			break
		end
	end

	if language_filename then
		loc:load_localization_file(Anticrash._path .. 'loc/' .. language_filename)
	end
	loc:load_localization_file(Anticrash._path .. 'loc/english.txt', false)
end)

Hooks:Add('MenuManagerInitialize', 'MenuManagerInitialize_Anticrash', function(menu_manager)
	function MenuCallbackHandler:AnticrashMultipleChoiceDefault(item)
		Anticrash.settings[item:name()] = Anticrash.action_types[item:value() + 1]
	end

	function MenuCallbackHandler:AnticrashMultipleChoice(item)
		Anticrash.settings[item:name()] = item:value()
	end

	function MenuCallbackHandler:AnticrashChangedFocus(focus)
		if not focus then
			Anticrash:save()
		end
	end

	MenuHelper:LoadFromJsonFile(Anticrash._path .. 'menu/options.txt', Anticrash, Anticrash.settings)

	Hooks:Add('MenuManagerBuildCustomMenus', 'MenuManagerBuildCustomMenus_Anticrash', function(menu_manager, nodes)
		nodes.anticrash_options_menu:parameters().modifier = {AnticrashCreator.modify_node}
	end)
end)

_G.AnticrashCreator = _G.AnticrashCreator or class()
function AnticrashCreator.modify_node(node)
	local old_items = node:items()
	old_items[1]._current_index = Anticrash.action_ranks[Anticrash.settings.anticrash_default_action] - 1

	node:clean_items()

	for i = 1, 2 do
		node:add_item(table.remove(old_items, 1))
	end

	local ordered = {}
	for source in pairs(Anticrash:get_all_sources()) do
		local action = Anticrash.settings[source] or 'default'
		table.insert(ordered, {
			name = source,
			action = action,
			action_rank = Anticrash.action_ranks[action],
		})
	end
	table.sort(ordered, function(a, b)
		if a.action_rank ~= b.action_rank then
			return a.action_rank > b.action_rank
		else
			return a.name < b.name
		end
	end)

	local data = { type = 'MenuItemMultiChoice' }
	for rank, action in ipairs(Anticrash.action_types) do
		table.insert(data, { _meta = 'option', text_id = 'anticrash_action_type_' .. action, value = action })
	end

	for _, source in pairs(ordered) do
		local params = {
			name = source.name,
			text_id = source.name:gsub('_', ' '),
			callback = 'AnticrashMultipleChoice',
			to_upper = false,
			localize = false,
			localize_help = true,
		}
		local new_item = node:create_item(data, params)
		new_item._current_index = Anticrash.action_ranks[source.action]
		node:add_item(new_item)
	end

	managers.menu:add_back_button(node)

	return node
end

Anticrash:load()

local band = bit.band
local string_byte = string.byte
local function utf8_is_ok(str)
	local i = 1
	while true do
		local c = string_byte(str, i, i)
		if not c then
			return true
		elseif c <= 127 then
			i = i + 1
		elseif c <= 193 then
			return false
		elseif c <= 223 then
			local c2 = string_byte(str, i + 1, i + 1)
			i = i + 2
			if not (c2 and band(c2, 192) == 128) then
				return false
			end
		elseif c <= 224 then
			local c2, c3 = string_byte(str, i + 1, i + 2)
			i = i + 3
			if not (c3 and c2 and band(c2, 160) == 160 and band(c3, 192) == 128) then
				return false
			end
		elseif c <= 236 then
			local c2, c3 = string_byte(str, i + 1, i + 2)
			i = i + 3
			if not (c3 and c2 and band(c2, 192) == 128 and band(c3, 192) == 128) then
				return false
			end
		elseif c <= 237 then
			local c2, c3 = string_byte(str, i + 1, i + 2)
			i = i + 3
			if not (c3 and c2 and band(c2, 224) == 128 and band(c3, 192) == 128) then
				return false
			end
		elseif c <= 239 then
			local c2, c3 = string_byte(str, i + 1, i + 2)
			i = i + 3
			if not (c3 and c2 and band(c2, 192) == 128 and band(c3, 192) == 128) then
				return false
			end
		elseif c <= 240 then
			local c2, c3, c4 = string_byte(str, i + 1, i + 3)
			i = i + 4
			if not (c4 and c3 and c2 and c2 >= 144 and c2 <= 191 and band(c3, 192) == 128 and band(c4, 192) == 128) then
				return false
			end
		elseif c <= 243 then
			local c2, c3, c4 = string_byte(str, i + 1, i + 3)
			i = i + 4
			if not (c4 and c3 and c2 and band(c2, 192) == 128 and band(c3, 192) == 128 and band(c4, 192) == 128) then
				return false
			end
		elseif c <= 244 then
			local c2, c3, c4 = string_byte(str, i + 1, i + 3)
			i = i + 4
			if not (c4 and c3 and c2 and band(c2, 240) == 128 and band(c3, 192) == 128 or band(c4, 192) == 128) then
				return false
			end
		else
			return false
		end
	end
end

utf8.is_ok = utf8_is_ok

function utf8.clean(str)
	if type(str) ~= 'string' then
		return str
	elseif utf8_is_ok(str) then
		return str
	else
		return '*ill-formed text*'
	end
end

function Anticrash.utf8_clean(text_fields, ...)
	local params = {...}
	for _, i in ipairs(text_fields) do
		params[i] = utf8.clean(params[i])
	end
	return unpack(params)
end

function Anticrash:rebuild_text_fields(filename)
	local network = SystemFS:exists(filename) and SystemFS:parse_xml(filename)
	if not network then
		return
	end

	local receiver2object = {
		connection = 'ConnectionNetworkHandler',
		unit = 'UnitNetworkHandler',
	}
	local objects_text_fields = {
		connection = {},
		unit = {},
	}
	local objects_exceptions = {
		connection = {
			join_request_reply = {
				[17] = true,
			},
			request_join = {
				[11] = true,
			},
			sync_outfit = {
				[4] = true,
			},
		},
		unit = {},
	}

	for rpc in network:children() do
		for msg in rpc:children() do
			local attributes = msg:parameters()
			local object_text_fields = objects_text_fields[attributes.receiver]
			if object_text_fields then
				local func_text_fields = {}
				local i = 2 -- 1 is self
				for param in msg:children() do
					local param_values = param:parameters()
					if param_values.type == 'string' or param_values.type == 'longstring' then
						local exceptions = objects_exceptions[attributes.receiver]
						if exceptions and exceptions[attributes.name] and exceptions[attributes.name][i] then
							-- qued
						else
							table.insert(func_text_fields, i)
						end
					end
					i = i + 1
				end
				if func_text_fields[1] then
					table.insert(object_text_fields, ('%s = { %s }'):format(attributes.name, table.concat(func_text_fields, ', ')))
				end
			end
		end
	end

	local output = {}
	for receiver, object_text_fields in pairs(objects_text_fields) do
		table.sort(object_text_fields)
		table.insert(output, ('Anticrash.objects.%s.text_fields = {\n	%s\n}'):format(receiver2object[receiver], table.concat(object_text_fields, ',\n	')))
	end

	local fh = io.open(self._path .. '/lua/text_fields.lua', 'w+')
	if fh then
		fh:write(table.concat(output, '\n'))
		fh:close()
	end
end

function Anticrash:log(object_name, fname, peer, ...)
	log('[Anticrash] error in ' .. object_name .. '.' .. fname .. '()')
	local params = {...}
	for i, v in ipairs(params) do
		log('[Anticrash] - param' .. i .. ': ' .. tostring(v))
	end
	if managers.network then
		if not peer then
			local sender = params[#params]
			peer = type(sender) == 'userdata' and sender.type_name == 'RPCCaller' and BaseNetworkHandler._verify_sender(sender)
		end
		self:take_action_against_peer(peer, fname)
	end
end

local ac_original_world = World
local ids_unit = Idstring('unit')
local fake_world = {
	spawn_unit = function(acw, ids_unit_name, ...)
		if not PackageManager:has(ids_unit, ids_unit_name:id()) then
			log('[Anticrash] ignored call to spawn a unit not loaded: ' .. tostring(ids_unit_name))
			return
		end
		return ac_original_world:spawn_unit(ids_unit_name, ...)
	end
}
Anticrash.original_world = World
Anticrash.fake_world = setmetatable({}, {
	__index = function (t, k)
		if fake_world[k] then
			return fake_world[k]
		else
			local vk = ac_original_world[k]
			if type(vk) == 'function' then
				return function (acw, ...)
					return vk(ac_original_world, ...)
				end
			else
				return vk
			end
		end
	end
})

function Anticrash:protect_spawn(object_name, fname, func_get_peer)
	local func = _G[object_name] and _G[object_name][fname]
	if type(func) ~= 'function' then
		log(('[Anticrash] %s.%s() not found!'):format(object_name, fname))
		return
	end
	_G[object_name][fname] = function(object_self, ...)
		World = self.fake_world
		local status = pcall(func, object_self, ...)
		World = self.original_world
		if not status then
			local peer = func_get_peer and func_get_peer(object_self)
			self:log(object_name, fname, peer, object_self, ...)
			self:clean(object_name, fname)
		end
	end
end

DelayedCalls:Add('Anticrash_stuff', 0, function()
	for object_name, stuff in pairs(Anticrash.objects) do
		local object = _G[object_name]
		for fname, func in pairs(object) do
			if type(func) == 'function' and fname ~= 'new' and Anticrash.settings[fname] ~= 'unprotected' then
				local protect_spawn = stuff.protect_spawn and stuff.protect_spawn[fname]
				local text_fields = stuff.text_fields and stuff.text_fields[fname]
				if protect_spawn then
					Anticrash:protect_spawn(object_name, fname)
				elseif text_fields then
					object[fname] = function(...)
						local status = pcall(func, Anticrash.utf8_clean(text_fields, ...))
						if not status then
							Anticrash:log(object_name, fname, nil, ...)
							Anticrash:clean(object_name, fname)
						end
					end
				elseif fname:sub(1, 1) ~= '_' then
					object[fname] = function(self, ...)
						local status = pcall(func, self, ...)
						if not status then
							Anticrash:log(object_name, fname, nil, self, ...)
							Anticrash:clean(object_name, fname)
						end
					end
				end
			end
		end
	end

	if ObjectInteractionManager then
		local ac_original_objectinteractionmanager_endactioninteract = ObjectInteractionManager.end_action_interact
		function ObjectInteractionManager.end_action_interact(...)
			local status = pcall(ac_original_objectinteractionmanager_endactioninteract, ...)
			if not status then
				Anticrash:send_to_chat(nil, 'end_action_interact')
			end
		end
	end
end)
