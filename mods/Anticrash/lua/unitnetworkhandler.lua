local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

function UnitNetworkHandler:player_action_walk_nav_point(unit, nav_point, speed, sender)
	if not self._verify_character_and_sender(unit, sender) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local slot = unit:slot()
	if slot == 3 or slot == 5 then
		unit:movement():sync_action_walk_nav_point(nav_point, speed)
	else
		Anticrash:take_action_against_peer(self._verify_sender(sender), 'player_action_walk_nav_point (manual)')
	end
end

function UnitNetworkHandler:set_stance(unit, stance_code, instant, execute_queued, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_character_and_sender(unit, sender) then
		return
	end

	local mov = unit:movement()
	if mov and mov._stance and mov._stance.values and mov._stance.values[stance_code] then
		mov:sync_stance(stance_code, instant, execute_queued)
	else
		Anticrash:take_action_against_peer(self._verify_sender(sender), 'set_stance (manual)')
	end
end
