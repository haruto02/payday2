local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

local mvec3_set = mvector3.set

local liwl_original_weapongadgetbase_init = WeaponGadgetBase.init
function WeaponGadgetBase:init(unit)
	liwl_original_weapongadgetbase_init(self, unit)
	if _G.liwl_is_local_player then
		self.liwl_is_local_player = true
	end
end
