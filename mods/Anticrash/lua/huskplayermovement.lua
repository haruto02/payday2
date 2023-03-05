local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

local function _get_peer(object)
	return type(object) == 'table' and managers.network:session():peer_by_unit(object._unit)
end

Anticrash:protect_spawn('HuskPlayerMovement', 'anim_cbk_spawn_melee_item', _get_peer)
Anticrash:protect_spawn('HuskPlayerMovement', 'anim_clbk_spawn_dropped_magazine', _get_peer)
