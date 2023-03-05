local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

local ac_original_networkmatchmakingsteam_isserverok = NetworkMatchMakingSTEAM.is_server_ok
function NetworkMatchMakingSTEAM:is_server_ok(friends_only, room, attributes_list, ...)
	if type(attributes_list) == 'table' and type(attributes_list.mods) == 'string' then
		local chunks = string.split(attributes_list.mods, '|')
		for i = #chunks, 1, -1 do
			chunks[i] = utf8.clean(chunks[i])
		end
		attributes_list.mods = table.concat(chunks, '|')
	end

	return ac_original_networkmatchmakingsteam_isserverok(self, friends_only, room, attributes_list, ...)
end
