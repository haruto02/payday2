local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

local ac_original_weaponfactorymanager_unpackblueprintfromstring = WeaponFactoryManager.unpack_blueprint_from_string
function WeaponFactoryManager:unpack_blueprint_from_string(factory_id, blueprint_string)
	local blueprint = ac_original_weaponfactorymanager_unpackblueprintfromstring(self, factory_id, blueprint_string)
	return Anticrash:sanitize_weapon(factory_id, blueprint)
end
