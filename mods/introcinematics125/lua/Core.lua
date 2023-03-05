function _include(file)
    dofile(IntroCinematics.PATHS.lua .. file)
end

if not Log then
    function Log(...) end
end


if not IntroCinematics then
    IntroCinematics = {}

    IntroCinematics.PATHS = {
        assets = ModPath .. "assets/",
        lua = ModPath .. "lua/"
    }

    IntroCinematics.HOOKS = {
        ["lib/setups/setup"] = {
            "managers/HologramManager.lua",
            "managers/IntroCinematicManager.lua",
        },
        ["lib/states/ingamewaitingforplayers"] = "managers/IntroCinematicManager.lua",
        ["lib/managers/hud/hudmissionbriefing"] = "managers/IntroCinematicManager.lua",
        ["lib/managers/hud/hudblackscreen"] = "managers/IntroCinematicManager.lua",
        ["lib/managers/voicebriefingmanager"] = "managers/IntroCinematicManager.lua",
        ["lib/tweak_data/levelstweakdata"] = "tweak_data/LevelsTweakData.lua"
    }

    IntroCinematics.managers = {}
    IntroCinematics.global = {}
    IntroCinematics.error = nil
    IntroCinematics.urls = {
        BeardLib = "https://modworkshop.net/mod/14924"
    }

    Hooks:RegisterHook("IntroCinematics:GlobalLoaded")

    function IntroCinematics:check_compat()

        if not BeardLib then
            IntroCinematics.error = {
                title = "Intro Cinematic mod can't be loaded",
                text = "BeardLib is required to use the Intro Cinematic mod\n ",
                button_list = {
                    {
                        text = "Download BeardLib",
                        callback_func = function()
                            Steam:overlay_activate("url", IntroCinematics.urls.BeardLib)
                        end
                    }
                }
            }

            return false
        end

        return true
    end

    function IntroCinematics:process_requires()
        _include("tweak_data/Globals.lua")

        Hooks:Call("IntroCinematics:GlobalLoaded")

        if RequiredScript then
            local hook_list = IntroCinematics.HOOKS[RequiredScript:lower()]
            if hook_list then
                if type(hook_list) == "string" then
                    hook_list = {hook_list}
                end
                for _, file_name in pairs(hook_list) do
                    dofile(IntroCinematics.PATHS.lua .. file_name)
                end
            end
        end
    end   
end

if IntroCinematics:check_compat() then
    IntroCinematics:process_requires()
end

if RequiredScript:lower() == "lib/managers/menu/menucomponentmanager" then

    -- Error reporting / compat

    Hooks:PostHook(MenuComponentManager, "create_player_profile_gui", "F_"..Idstring("PostHook:MenuComponentManager:create_player_profile_gui"):key(), function(self)
        if IntroCinematics.error and IntroCinematics.error.title then
            managers.system_menu:show(IntroCinematics.error)
        end
    end)
end

if RequiredScript:lower() == "core/lib/setups/coresetup" then

    -- Global updater

    Hooks:PostHook(CoreSetup, "__update", "F_"..Idstring("PostHook:CoreSetup:__update"):key(), function(self,t,dt)
        if IntroCinematics.managers.holograms then
            IntroCinematics.managers.holograms:update(t,dt)
        end
    end)
end