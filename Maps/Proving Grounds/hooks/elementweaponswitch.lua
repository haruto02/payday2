core:import("CoreMissionScriptElement")
ElementWeaponSwitch = ElementWeaponSwitch or class(CoreMissionScriptElement.MissionScriptElement)

function ElementWeaponSwitch:init(...)
	ElementWeaponSwitch.super.init(self, ...)
end

function ElementWeaponSwitch:client_on_executed(...)
    self:on_executed(...)
end

function ElementWeaponSwitch:on_executed(instigator)
    if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
    end

    -- Base Factory ID before assuming the current slot
    local factory_id = self._values.weapon_id or "wpn_fps_ass_m4"

    -- Script used to get the start weapons
    local current_index_equipped = instigator:inventory():equipped_selection()
    local index_wtf = current_index_equipped == 1 and true or false

    -- Then we init the blueprint, depending if it's a string or table
    local blueprint_fucking_ovk
    local blueprint_table = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
    local blueprint_to_string = managers.weapon_factory:blueprint_to_string(factory_id, blueprint_table)

    -- thanks ovk
    if instigator ~= managers.player:player_unit() then
        blueprint_fucking_ovk = blueprint_to_string
    else
        blueprint_fucking_ovk = blueprint_table
    end

    -- Init final table
    local new_weapon_data = {
        equip = index_wtf,
        factory_id = factory_id,
        blueprint = blueprint_fucking_ovk,
        global_values = {},
        instant = false,
        cosmetics = "serbu_lones-1-0"
    }
    
    -- Adding the weapon
    if self._values.instigator_only then
        instigator:inventory():add_unit_by_factory_name(new_weapon_data.factory_id, new_weapon_data.equip, new_weapon_data.instant, new_weapon_data.blueprint, new_weapon_data.cosmetics)
        if instigator:movement().sync_equip_weapon then
            instigator:movement():sync_equip_weapon()
        end
        if instigator:inventory().equip_selection then
            instigator:inventory():equip_selection(current_index_equipped, false)
		end
    else
        managers.player:player_unit():inventory():add_unit_by_factory_name(new_weapon_data.factory_id, new_weapon_data.equip, new_weapon_data.instant, new_weapon_data.blueprint, new_weapon_data.cosmetics)
        if managers.player:player_unit():movement().sync_equip_weapon then
            managers.player:player_unit():movement():sync_equip_weapon()
        end
        if  managers.player:player_unit():inventory().equip_selection then
            managers.player:player_unit():inventory():equip_selection(current_index_equipped, false)
		end
	end
	
	managers.player:_change_player_state()

    ElementWeaponSwitch.super.on_executed(self, instigator)
end

function ElementWeaponSwitch:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementWeaponSwitch:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementWeaponSwitch:load(data)
    self:set_enabled(data.enabled)
end