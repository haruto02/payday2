if RequiredScript == "lib/managers/enemymanager" then
	EnemyManager._MAX_NR_CORPSES = 0
	EnemyManager.MAX_MAGAZINES = 0
	local old_init = EnemyManager.init
	function EnemyManager:init(...)
		old_init(self, ...)
		self._corpse_disposal_upd_interval = 0
		self._shield_disposal_upd_interval = 0
		self._shield_disposal_lifetime = 0
		self._MAX_NR_SHIELDS = 0
	end
	local old_limit = EnemyManager.corpse_limit
	function EnemyManager:corpse_limit(...)
		local limit = old_limit(self, ...)
		if limit and limit > 0 then
			limit = 0
		end
		return limit
	end
end

if RequiredScript == "lib/managers/gameplaycentralmanager" then
	local old_init = GamePlayCentralManager.init
	function GamePlayCentralManager:init(...)
		old_init(self, ...)
		self._block_bullet_decals = true
		self._block_blood_decals = true
	end
	function GamePlayCentralManager:_play_bullet_hit(...)
		return
	end
	function GamePlayCentralManager:play_impact_flesh(...)
		return
	end
	function GamePlayCentralManager:sync_play_impact_flesh(...)
		return
	end
end

if RequiredScript == "lib/units/enemies/cop/copdamage" then
	function CopDamage:_spawn_head_gadget(...)
		return
	end
end