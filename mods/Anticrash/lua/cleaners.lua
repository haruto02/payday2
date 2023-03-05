Anticrash.cleaners = {}

function Anticrash:clean(object_name, fname)
	local cleaner = self.cleaners[object_name] and self.cleaners[object_name][fname]
	if cleaner then
		cleaner()
	end
end

Anticrash.cleaners.UnitNetworkHandler = {}
Anticrash.cleaners.UnitNetworkHandler.server_secure_loot = function()
	local secured = Global.loot_manager.secured
	for i = #secured, 1, -1 do
		local carry_id = secured[i].carry_id
		if carry_id == 'small_loot' or not tweak_data.carry[carry_id] and not tweak_data.carry.small_loot[carry_id] then
			table.remove(secured, i)
		end
	end
end

Anticrash.cleaners.UnitNetworkHandler.sync_secure_loot = Anticrash.cleaners.UnitNetworkHandler.server_secure_loot
