local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

function BaseNetworkHandler._verify_character(unit)
	if alive(unit) then
		local cd = unit:character_damage()
		if cd and not cd:dead() then
			return true
		end
	end
	return false
end
