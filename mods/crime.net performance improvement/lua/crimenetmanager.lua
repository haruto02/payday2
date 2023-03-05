require("lib/managers/menu/WalletGuiObject")

CrimeNetManager = CrimeNetManager or class()

CrimeNetManager._find_online_games_win32 = function(self, friends_only)

	-- Lines: 1070 to 1226
	local function f(info)
		managers.network.matchmake:search_lobby_done()

		local room_list = info.room_list
		local attribute_list = info.attribute_list
		local dead_list = {}

		for id, _ in pairs(self._active_server_jobs) do
			dead_list[id] = true
		end

		local friends_list = Steam:logged_on() and Steam:friends()
		local friend_ids = {}

		if friends_list then
			for i, friend in ipairs(friends_list) do
				friend_ids[friend:id()] = true
			end
		end

		for i, room in ipairs(room_list) do
			local name_str = tostring(room.owner_name)
			local attributes_numbers = attribute_list[i].numbers
			local attributes_mutators = attribute_list[i].mutators

			if managers.network.matchmake:is_server_ok(friends_only, room.owner_id, attribute_list[i], nil) then
				dead_list[room.room_id] = nil
				local host_name = name_str
				local level_id = tweak_data.levels:get_level_name_from_index(attributes_numbers[1] % 1000)
				local name_id = level_id and tweak_data.levels[level_id] and tweak_data.levels[level_id].name_id
				local level_name = name_id and managers.localization:text(name_id) or "LEVEL NAME ERROR"
				local difficulty_id = attributes_numbers[2]
				local difficulty = tweak_data:index_to_difficulty(difficulty_id)
				local job_id = tweak_data.narrative:get_job_name_from_index(math.floor(attributes_numbers[1] / 1000))
				local kick_option = attributes_numbers[8]
				local job_plan = attributes_numbers[10]
				local drop_in = attributes_numbers[6]
				local permission = attributes_numbers[3]
				local min_level = attributes_numbers[7]
				local state_string_id = tweak_data:index_to_server_state(attributes_numbers[4])
				local state_name = state_string_id and managers.localization:text("menu_lobby_server_state_" .. state_string_id) or "UNKNOWN"
				local state = attributes_numbers[4]
				local num_plrs = attributes_numbers[5]
				local is_friend = friend_ids[room.room_id] or false

				if name_id then
					if not self._active_server_jobs[room.room_id] then
						if table.size(self._active_jobs) + table.size(self._active_server_jobs) < tweak_data.gui.crime_net.job_vars.total_active_jobs and table.size(self._active_server_jobs) < self._max_active_server_jobs then
							self._active_server_jobs[room.room_id] = {
								added = false,
								alive_time = 0
							}

							managers.menu_component:add_crimenet_server_job({
								room_id = room.room_id,
								host_id = room.owner_id,
								id = room.room_id,
								level_id = level_id,
								difficulty = difficulty,
								difficulty_id = difficulty_id,
								num_plrs = num_plrs,
								host_name = host_name,
								state_name = state_name,
								state = state,
								level_name = level_name,
								job_id = job_id,
								is_friend = is_friend,
								kick_option = kick_option,
								job_plan = job_plan,
								mutators = attribute_list[i].mutators,
								is_crime_spree = attribute_list[i].crime_spree and attribute_list[i].crime_spree >= 0,
								crime_spree = attribute_list[i].crime_spree,
								crime_spree_mission = attribute_list[i].crime_spree_mission,
								drop_in = drop_in,
								permission = permission,
								min_level = min_level,
								mods = attribute_list[i].mods,
								one_down = attribute_list[i].one_down,
								is_skirmish = attribute_list[i].skirmish and attribute_list[i].skirmish > 0,
								skirmish = attribute_list[i].skirmish,
								skirmish_wave = attribute_list[i].skirmish_wave,
								skirmish_weekly_modifiers = attribute_list[i].skirmish_weekly_modifiers
							})
						end
					else
						managers.menu_component:update_crimenet_server_job({
							room_id = room.room_id,
							host_id = room.owner_id,
							id = room.room_id,
							level_id = level_id,
							difficulty = difficulty,
							difficulty_id = difficulty_id,
							num_plrs = num_plrs,
							host_name = host_name,
							state_name = state_name,
							state = state,
							level_name = level_name,
							job_id = job_id,
							is_friend = is_friend,
							kick_option = kick_option,
							job_plan = job_plan,
							mutators = attribute_list[i].mutators,
							is_crime_spree = attribute_list[i].crime_spree and attribute_list[i].crime_spree >= 0,
							crime_spree = attribute_list[i].crime_spree,
							crime_spree_mission = attribute_list[i].crime_spree_mission,
							drop_in = drop_in,
							permission = permission,
							min_level = min_level,
							mods = attribute_list[i].mods,
							one_down = attribute_list[i].one_down,
							is_skirmish = attribute_list[i].skirmish and attribute_list[i].skirmish > 0,
							skirmish = attribute_list[i].skirmish,
							skirmish_wave = attribute_list[i].skirmish_wave,
							skirmish_weekly_modifiers = attribute_list[i].skirmish_weekly_modifiers
						})
					end
				end
			end
		end

		for id, _ in pairs(dead_list) do
			self._active_server_jobs[id] = nil

			managers.menu_component:remove_crimenet_gui_job(id)
		end
	end

	managers.network.matchmake:register_callback("search_lobby", f)
	managers.network.matchmake:search_lobby(friends_only)

	-- Lines: 1231 to 1235
	local function usrs_f(success, amount)
		if success then
			managers.menu_component:set_crimenet_players_online(amount)
		end
	end

	Steam:sa_handler():concurrent_users_callback(usrs_f)
	Steam:sa_handler():get_concurrent_users()
end