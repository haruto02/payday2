Hooks:PostHook(ElementBLCustomAchievement, "init", "init_prov_grnd_package", function (self)
CustomAchievementPackage:init("prov_grnd_package")
end)

local function CheckUnlocked(ach_id, package_id)
    return true
end



Hooks:PostHook(ElementDangerZone, "on_executed", "init_prov_grnd_achievements", function (self)
        if CheckUnlocked("prov_grnd_50k", "prov_grnd_package") == true then
            local element = managers.mission:get_mission_element_by_name("enable_unlock_kills")
            element:on_executed()
        end
		
		if CheckUnlocked("prov_grnd_100k", "prov_grnd_package") == true then
            local element = managers.mission:get_mission_element_by_name("enable_unlock_all")
            element:on_executed()
        end
		
		if CheckUnlocked("prov_grnd_range", "prov_grnd_package") == true then
            local element = managers.mission:get_mission_element_by_name("enable_unlock_range")
            element:on_executed()
        end
		
		if CheckUnlocked("prov_grnd_cookie", "prov_grnd_package") == true then
            local element = managers.mission:get_mission_element_by_name("enable_unlock_cookie")
            element:on_executed()
        end
end)