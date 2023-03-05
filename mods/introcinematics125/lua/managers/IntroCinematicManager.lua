_include("managers/holograms/IntroCinematicDifficulty.lua")
_include("utils/Easing.lua")

function format_custom_level_data(ic_data)
    if  ic_data.from and
        ic_data.from.pos and
        ic_data.from.rot and
        ic_data.to and
        ic_data.to.pos and
        ic_data.to.rot and
        ic_data.length and
        ic_data.hologram and
        ic_data.hologram.pos and
        ic_data.hologram.size and
        ic_data.hologram.start and
        (ic_data.hologram.rot or ic_data.hologram.align) then

        local outData = {
            timeline = {
                [0] = {
                    path = {
                        BeardLib.Utils:normalize_string_value(ic_data.from.pos),
                        BeardLib.Utils:normalize_string_value(ic_data.from.rot)
                    }
                },
                [100] = {
                    path = {
                        BeardLib.Utils:normalize_string_value(ic_data.to.pos),
                        BeardLib.Utils:normalize_string_value(ic_data.to.rot)
                    }
                }
            },
            length = tonumber(ic_data.length),
            hologram = {
                pos = BeardLib.Utils:normalize_string_value(ic_data.hologram.pos),
                size = tonumber(ic_data.hologram.size),
                start = tonumber(ic_data.hologram.start),
            }
        }

        if ic_data.hideblackbars then
            outData.hideblackbars = true
        end

        if ic_data.title then
            outData.title = ic_data.title
        end

        if ic_data.from.easing then
            -- TODO: check easing types
            outData.timeline[0].easing = ic_data.from.easing
        end

        if ic_data.hologram.rot then
            outData.hologram.rot = BeardLib.Utils:normalize_string_value(ic_data.hologram.rot)
        elseif ic_data.hologram.align then
            outData.hologram.align = ic_data.hologram.align
        end

        return outData
    end
end

function get_level_data(id)
    local data = tweak_data.levels[managers.job:current_level_id()]
    if data and data.cine_data then return data.cine_data
    elseif data and data.ic_data then
        local cine_data = format_custom_level_data(data.ic_data)

        if cine_data then return cine_data
        else return nil end
    else
        data = tweak_data["level_"..managers.job:current_level_id()]
        if data and data.cine_data then return data.cine_data
        else return nil end
    end
end

if not ThuverX_CinematicCamera then
    ThuverX_CinematicCamera = class()
    function ThuverX_CinematicCamera:init(unit)
        self._unit = unit
        self._camera = World:create_camera()
    
        self._camera:set_fov(90)
        self._camera:set_near_range(7.5)
        self._camera:set_far_range(200000)
    
        self._viewport = managers.viewport:new_vp(0, 0, 1, 1, "ThuverX_CinematicCamera", CoreManagerBase.PRIO_WORLDCAMERA)
        self._director = self._viewport:director()
        self._shaker = self._director:shaker()
        self._camera_controller = self._director:make_camera(self._camera, Idstring("previs_camera"))
    
        self._viewport:set_camera(self._camera)
        self._director:set_camera(self._camera_controller)
        self._director:position_as(self._camera)
        self._camera_controller:set_both(self._unit:get_object(Idstring("rp_waiting_camera_01")))
    end

    function ThuverX_CinematicCamera:camera()
        return self._camera
    end

    function ThuverX_CinematicCamera:shaker()
        return self._shaker
    end

    function ThuverX_CinematicCamera:viewport()
        return self._viewport
    end

    function ThuverX_CinematicCamera:set_active(x)
        self._viewport:set_active(x)
    end

    function ThuverX_CinematicCamera:destroy()
        if self._viewport then
            self._viewport:destroy()
    
            self._viewport = nil
        end
    
        if alive(self._camera) then
            World:delete_camera(self._camera)
    
            self._camera = nil
        end
    end
    
end

if not IntroCinematicManager then
    IntroCinematicManager = class()

    function IntroCinematicManager:init()
        self._name = "IntroCinematicManager"
        self.dialog_meta_data = {}
    end

    function IntroCinematicManager:connect_mission_briefingui(safe,full)
        self.__safe_ws = safe
        self.__full_ws = full
    end

    function IntroCinematicManager:connect_mission_dialog_meta_data(data)
        if not data then return end
        self.dialog_meta_data = data
    end

    function IntroCinematicManager:play(waiting_state,map)
        local map_data = get_level_data(map)
        if not map_data then
            return
        end
        
        self.waiting_state = waiting_state
        self.map_data = map_data
        self.map = map

        self.__safe_ws:panel():set_visible(false)
        self.__full_ws:panel():set_visible(false)

        managers.overlay_effect:stop_effect(waiting_state._fade_out_id)
        managers.overlay_effect:play_effect(tweak_data.overlay_effects.level_fade_in)

        managers.hud:hide_mission_briefing_hud()
        managers.hud:hide(waiting_state.GUI_SAFERECT)
	    managers.hud:hide(waiting_state.GUI_FULLSCREEN)
        managers.hud:hide(waiting_state.LEVEL_INTRO_GUI)
        
        waiting_state._camera_data.next_t = 9999999
        waiting_state._cam_unit:set_position(Vector3(0,0,-90000))
        waiting_state._cam_unit:camera():start(999999)
        waiting_state._cam_unit:camera()._viewport:set_active(false)

        self.cine_cam_unit = CoreUnit.safe_spawn_unit("introcinematics/units/camera/cinematic_camera", Vector3(), Rotation())
        self.cine_cam = self.cine_cam_unit:camera():camera()

        self.cine_cam_unit:camera():set_active(true)
        self._cine_active = true
        
        self.starting_time = -1
        self.done = false

        local billboard = nil
        if map_data.hologram.align == "billboard_x" then
            billboard = Workspace.BILLBOARD_Y
        elseif map_data.hologram.align == "billboard_y" then
            billboard = Workspace.BILLBOARD_X
        elseif map_data.hologram.align == "billboard_both" then
            billboard = Workspace.BILLBOARD_BOTH
        end

        self.stage_lookup_table = {}
        self.reverse_stage_lookup_table = {}

        local i = 0
        for k,_ in pairs(map_data.timeline) do
            i = i + 1
            self.stage_lookup_table[i] = k
            self.reverse_stage_lookup_table[k] = i
        end

        table.sort(self.stage_lookup_table)
        table.sort(self.reverse_stage_lookup_table)

        self.mem = {
            effects = {},
            overlay_effects = {},
            units = {},
            shakers = {},
            lights = {},
            special_lights = {},
            custom = {},
            all_units = nil,
            hidden_units = {},
            pos_rot = {
                Vector3(0,0,0),
                Rotation(0,0,0)
            }
        }

        if not map_data.hideblackbars then
            self.blackbar_ws = managers.gui_data:create_fullscreen_workspace()
            self.blackbar_ws:panel():rect({
                name = "bbtop",
                color = Color.black,
                h = self.blackbar_ws:panel():h() * 0.15,
                layer = 40
            })

            self.blackbar_ws:panel():rect({
                name = "bbbot",
                color = Color.black,
                y = self.blackbar_ws:panel():h() * 0.85,
                h = self.blackbar_ws:panel():h() * 0.15,
                layer = 40
            })
        end

        if map_data.update then
            assert(loadstring("function __custom_update(self,timeline,stage,next_stage,local_progress,t,dt)"..map_data.update.." end"))()
            self.__custom_update = __custom_update
            if not map_data.__original then
                print("[IntroCinematicManager] Map",map,"has a custom update script. Forward errors or crashes to the map creator.")
            end
        end    

        self.__custom_scripts = {}

        for k,v in pairs(map_data.timeline) do
            if v.script then
                assert(loadstring("function __custom_script(self,timeline,stage,next_stage,local_progress,t,dt)"..v.script.." end"))()
            
                self.__custom_scripts[k] = __custom_script
            end
        end

        if #self.__custom_scripts > 0 and not map_data.__original then
            print("[IntroCinematicManager] Map",map,"has a custom timeline scripts. Forward errors or crashes to the map creator.")
        end


        self.skipped = false

        self.last_executed_stage = -1
        self.timeline_stage = 0
        self.timeline_stage_next = -1
        self.timeline_stage_with_path = 0
        self.timeline_stage_with_path_next = -1

        --[[
            Shaker types:
            breathing
            cash_opening
            fire_weapon_kick
            fire_weapon_rot
            headbob
            melee_hit
            melee_hit_var2
            player_bleedout_land
            player_fall_damage
            player_freefall
            player_land
            player_taser_shock
            whizby
        ]]

        self.hologram = IntroCinematics.managers.holograms:create({
            name = "intro_hologram",
            world_pos = map_data.hologram.pos,
            world_rot = map_data.hologram.rot,
            world_size = map_data.hologram.size and {map_data.hologram.size*2,map_data.hologram.size} or {1200,600},
            size = {2000,1000},
            debug = false,
            billboard = billboard,
            update = function (t,dt)
                if self.starting_time == -1 then
                    self.starting_time = t
                end

                if self.mem.all_units == nil then
                    self.mem.all_units = {}
                    for _,u in pairs(World:find_units_quick("all")) do
                        if u.unit_data and u:unit_data() and u:unit_data().unit_id then
                            self.mem.all_units[u:unit_data().unit_id] = u
                        end
                    end
                end

                if not self.done then
                    local local_time = t - self.starting_time
                    local local_progress = local_time / map_data.length
                    local step = math.round(local_progress * 100)

                    for k,v in pairs(map_data.timeline) do
                        if k < step and k >= self.timeline_stage then
                            self.timeline_stage = k
                            if v and v.path then
                                self.timeline_stage_with_path = k
                            end
                        end
                    end

                    local stage = map_data.timeline[self.timeline_stage]

                    -- runs once on enter
                    if self.last_executed_stage ~= self.timeline_stage then
                        self.timeline_stage_next = self.stage_lookup_table[self.reverse_stage_lookup_table[self.timeline_stage] + 1] or -1
                    
                        if stage.fov then
                            self.cine_cam:set_fov(stage.fov or 90)
                        end

                        for i = self.reverse_stage_lookup_table[self.timeline_stage],#self.stage_lookup_table do
                            local part = map_data.timeline[self.stage_lookup_table[i]]
                            if self.stage_lookup_table[i] > self.timeline_stage and part and part.path then
                                self.timeline_stage_with_path_next = self.stage_lookup_table[i]
                                break
                            end
                        end

                        if stage.effects then
                            for n,e in pairs(stage.effects) do
                                if e.effect then
                                    local ef_id = World:effect_manager():spawn({
                                        effect = Idstring(e.effect),
                                        position = e.position or Vector3(0, 0, 0),
                                        normal = e.normal or Vector3(0, 0, 0)
                                    })

                                    self.mem.effects[n] = ef_id
                                end
                            end
                        end


                        if stage.hide_units then
                            for _,u in pairs(stage.hide_units) do
                                if self.mem.all_units[u] then
                                    local unit = self.mem.all_units[u]
                                    if unit.set_visible then unit:set_visible(false)
                                    else unit:set_enabled(false) end

                                    self.mem.hidden_units[u] = unit
                                end
                            end
                        end

                        if stage.unhide_units then
                            for x,unit in pairs(stage.unhide_units) do
                                if self.mem.hidden_units[x] then
                                    if unit.set_visible then unit:set_visible(true)
                                    else unit:set_enabled(true) end

                                    self.mem.hidden_units[x] = nil
                                end
                            end
                        end
                    
                        if stage.lights then 
                            for n,e in pairs(stage.lights) do
                                if e.type then
                                    local light = World:create_light("omni|specular")

                                    if e.multiplier then
                                        light:set_multiplier(e.multiplier or LightIntensityDB:lookup(Idstring("identity")))
                                    end

                                    if e.spot_angle_end then
                                        light:set_spot_angle_end(e.spot_angle_end)
                                    end

                                    if e.near_range then
                                        light:set_near_range(e.near_range)
                                    end

                                    if e.far_range then
                                        light:set_far_range(e.far_range)
                                    end

                                    light:set_color(e.color or Vector3(1, 1, 1))
                                    light:set_position(e.position or Vector3(0,0,0))
                                    light:set_rotation(e.rotation or Rotation(0,0,0))
                                    light:set_enable(true)

                                    if e.special then
                                        self.mem.special_lights[n] = {
                                            light = light,
                                            special = e.special,
                                            params = e.special_params or {}
                                        }
                                        
                                    else
                                        self.mem.lights[n] = light
                                    end

                                    
                                end
                            end
                        end

                        if stage.shakers then
                            for n,e in pairs(stage.shakers) do
                                if e.id then
                                    local shake_id = nil
                                    if e.params then
                                        shake_id = self.cine_cam_unit:camera():shaker():play(e.id, unpack(e.params))
                                    else
                                        shake_id = self.cine_cam_unit:camera():shaker():play(e.id)
                                    end
                                    self.mem.shakers[n] = shake_id
                                end
                            end
                        end

                        if stage.units then
                            for n,e in pairs(stage.units) do
                                if e.id then
   
                                    local unit = World:spawn_unit(
                                        Idstring(e.id),
                                        e.position or Vector3(0, 0, 0),
                                        e.rotation or Rotation(0, 0, 0)
                                    )

                                    self.mem.units[n] = unit
                                end
                            end
                        end    

                        if stage.stop_shakers then
                            for _,e in pairs(stage.stop_shakers) do
                                if self.mem.shakers[e] then
                                    self.cine_cam_unit:camera():shaker():stop(self.mem.shakers[e])
                                end
                            end
                        end

                        if stage.kill_shakers then
                            for _,e in pairs(stage.kill_shakers) do
                                if self.mem.shakers[e] then
                                    self.cine_cam_unit:camera():shaker():stop_immediately(self.mem.shakers[e])
                                end
                            end
                        end

                        if stage.delete_lights then
                            for _,e in pairs(stage.delete_lights) do
                                if self.mem.lights[e] then
                                    World:delete_light(self.mem.lights[e])
                                    self.mem.lights[e] = nil
                                end

                                if self.mem.special_lights[e] then
                                    World:delete_light(self.mem.special_lights[e].light)
                                    self.mem.special_lights[e] = nil
                                end
                            end
                        end

                        if stage.delete_units then
                            for _,e in pairs(stage.delete_units) do
                                if self.mem.units[e] then
                                    World:delete_unit(self.mem.units[e])
                                    self.mem.units[e] = nil
                                end
                            end
                        end

                        if stage.delete_effects then
                            for _,e in pairs(stage.delete_effects) do
                                if self.mem.effects[e] then
                                    World:effect_manager():kill(self.mem.effects[e])
                                    self.mem.effects[e] = nil
                                end
                            end
                        end

                        if self.__custom_scripts[self.timeline_stage] then
                            self.__custom_scripts[self.timeline_stage](self,self.timeline,stage,map_data.timeline[self.timeline_stage_next],local_progress,t,dt)
                        end

                        if step < 100 then
                            -- Don't do on last, leave that to cleanup
                            for _,k in pairs(self.mem.overlay_effects) do
                                managers.overlay_effect:stop_effect(k)
                            end
                        end

                        if stage.fade_in then
                            local o_ef_id = managers.overlay_effect:play_effect({
                                blend_mode = "normal",
                                sustain = 0,
                                play_paused = true,
                                fade_in = 0,
                                fade_out = stage.fade_in or 1,
                                color = Color(1, 0, 0, 0),
                                timer = TimerManager:main()
                            })
                            table.insert(self.mem.overlay_effects,o_ef_id)
                        end
                    end

                    if self.timeline_stage_next == 100 and not stage.fade_out then
                        stage.fade_out = 1
                    end

                    for _,k in pairs(self.mem.special_lights) do
                        if k then
                            if k.special == "cop_light" then
                                if math.floor(math.fmod(t*100,(k.params.speed or 0.2) * 100)) == 0 then
                                    if k.current == Vector3(1,0,0) then
                                        k.light:set_color(Vector3(0,0,1))
                                        k.current = Vector3(0,0,1)  
                                    else
                                        k.light:set_color(Vector3(1,0,0))
                                        k.current = Vector3(1,0,0)
                                    end
                                end
                            end

                            if k.special == "beep" then
                                if math.floor(math.fmod(t*100,(k.params.speed or 0.2) * 100)) == 0 then
                                    if k.current == Vector3(0,0,0) then
                                        k.light:set_color(Vector3(1,0,0))
                                        k.current = Vector3(1,0,0)  
                                    else
                                        k.light:set_color(Vector3(0,0,0))
                                        k.current = Vector3(0,0,0)
                                    end
                                end
                            end
                        end
                    end

                    if stage.blackscreen then
                        local o_ef_id = managers.overlay_effect:play_effect({
                            blend_mode = "normal",
                            play_paused = true,
                            fade_in = 0,
                            fade_out = 0,
                            color = Color(1, 0, 0, 0),
                            timer = TimerManager:main()
                        })
                        table.insert(self.mem.overlay_effects,o_ef_id)
                    end

                    if stage.fade_out and local_time >= (self.timeline_stage_next*0.01) * map_data.length - stage.fade_out  then
                        local o_ef_id = managers.overlay_effect:play_effect({
                            blend_mode = "normal",
                            play_paused = true,
                            fade_in = stage.fade_out or 1,
                            fade_out = 0,
                            color = Color(1, 0, 0, 0),
                            timer = TimerManager:main()
                        })
                        table.insert(self.mem.overlay_effects,o_ef_id)
                    end

                    if map_data.timeline[self.timeline_stage_with_path].lerp == false or self.timeline_stage_with_path_next == -1 then
                        self.mem.pos_rot[1] = map_data.timeline[self.timeline_stage_with_path].path[1]
                        self.mem.pos_rot[2] = map_data.timeline[self.timeline_stage_with_path].path[2]
                    elseif self.timeline_stage_with_path_next ~= -1 then
                        local dist = (self.timeline_stage_with_path_next - self.timeline_stage_with_path) * 0.01
                        local lerp_progress = (local_progress - self.timeline_stage_with_path * 0.01) / dist

                        lerp_progress = math.max(0,math.min(1,lerp_progress))

                        if map_data.timeline[self.timeline_stage_with_path].easing then
                            lerp_progress = Easing[map_data.timeline[self.timeline_stage_with_path].easing](lerp_progress)
                        end

                        if map_data.timeline[self.timeline_stage_with_path].mod_path_speed then
                            lerp_progress = lerp_progress * map_data.timeline[self.timeline_stage_with_path].mod_path_speed 
                        end

                        if stage.fov and stage.smooth_fov then
                            local from_fov = map_data.timeline[self.timeline_stage_with_path].fov or 90
                            local to_fov = map_data.timeline[self.timeline_stage_with_path_next].fov or from_fov

                            self.cine_cam:set_fov(math.lerp(from_fov, to_fov, lerp_progress))
                        end

                        mvector3.lerp(self.mem.pos_rot[1],
                            map_data.timeline[self.timeline_stage_with_path].path[1],
                            map_data.timeline[self.timeline_stage_with_path_next].path[1],
                            lerp_progress)
                        mrotation.slerp(self.mem.pos_rot[2],
                            map_data.timeline[self.timeline_stage_with_path].path[2],
                            map_data.timeline[self.timeline_stage_with_path_next].path[2],
                            lerp_progress)
                    end

                    self.cine_cam_unit:set_position(self.mem.pos_rot[1])
                    self.cine_cam_unit:set_rotation(self.mem.pos_rot[2])

                    if self._update then
                        self._update(self.starting_time + (map_data.hologram.start or 0) * 0.01 * map_data.length,t,dt)
                    end

                    if waiting_state._skipped and not self.skipped then
                        waiting_state._delay_start_t = t + 2
                        self.skipped = true
                    end

                    if waiting_state._fadeout_loading_icon and waiting_state._fadeout_loading_icon._panel then
                        waiting_state._fadeout_loading_icon._panel:set_visible(false)
                    end

                    if self.__custom_update then
                        self.__custom_update(self,self.timeline,stage,map_data.timeline[self.timeline_stage_next],local_progress,t,dt)
                    end

                    self.last_executed_stage = self.timeline_stage
                end
            end
        })

        local level_data = managers.job:current_level_data()

        local lang = SystemInfo:language():key() or Idstring("english")

        self._update = IntroCinematicDifficultyHologram(self.hologram:get_panel(),{
            heist_name = map_data.title or managers.localization:text(level_data.name_id),
            difficulty = managers.job:current_difficulty_stars(),
            size = map_data.hologram.size or 500,
            font = map_data.font or IntroCinematics.global.languages[lang].font,
            main_color = map_data.main_color or IntroCinematics.global.colors.main_color,
            risk_color = map_data.risk_color or IntroCinematics.global.colors.risk_color,
            title_font_size = (map_data.title_font_size or 1) * IntroCinematics.global.languages[lang].title_font_size,
            difficulty_font_size = (map_data.difficulty_font_size or 1) * IntroCinematics.global.languages[lang].difficulty_font_size,
            difficulty_icon_size = (map_data.difficulty_icon_size or 1) * IntroCinematics.global.languages[lang].difficulty_icon_size
        })
    end

    function IntroCinematicManager:delay_hook()
        if self.map_data then
            self.waiting_state._delay_start_t = self.starting_time + self.map_data.length
        end
    end

    function IntroCinematicManager:cleanup()
        for _,k in pairs(self.mem.overlay_effects) do
            managers.overlay_effect:stop_effect(k)
        end
        for _,k in pairs(self.mem.effects) do
            if k then
                World:effect_manager():kill(k)
            end
        end

        for _,k in pairs(self.mem.units) do
            if k then
                World:delete_unit(k)
            end
        end

        for _,k in pairs(self.mem.lights) do
            if k then
                World:delete_light(k)
            end
        end

        for _,k in pairs(self.mem.special_lights) do
            if k then
                World:delete_light(k.light)
            end
        end

        for _,k in pairs(self.mem.shakers) do
            if k then
                self.cine_cam_unit:camera():shaker():stop_immediately(k)
            end
        end

        if self.map_data.cleanup then
            assert(loadstring("function __custom_cleanup(self)"..self.map_data.cleanup.." end"))()
            __custom_cleanup(self)
            if not self.map_data.__original then
                print("[IntroCinematicManager] Map",self.map,"has a custom cleanup script. Forward errors or crashes to the map creator.")
            end
        end


        for _,unit in pairs(self.mem.hidden_units) do
            if unit then
                if unit.set_visible then unit:set_visible(true)
                else unit:set_enabled(true) end
            end
        end

        self.mem.units = {}
        self.mem.overlay_effects = {}
        self.mem.effects = {}
        self.mem.shakers = {}
        self.mem.lights = {}
        self.mem.special_lights = {}
        self.mem.custom = {}
        self.mem.all_units = nil
        self.mem.hidden_units = {}
    end

    function IntroCinematicManager:on_end()
        if self.hologram then
            self.hologram:get_panel():set_visible(false)
            self.hologram:destroy()

            self:cleanup()
        
            self.__safe_ws:panel():set_visible(true)
            self.__full_ws:panel():set_visible(true)
            managers.overlay_effect:play_effect(tweak_data.overlay_effects.level_fade_in)

            if self.blackbar_ws then
                managers.gui_data:destroy_workspace(self.blackbar_ws)
            end
        end
        if self._cine_active then
            -- Also destroy all the shit with it
            self.cine_cam_unit:camera():destroy()
        end

        self.done = true
    end
end


if RequiredScript:lower() == "lib/setups/setup" then
    IntroCinematics.managers.introcinematics = IntroCinematics.managers.introcinematics or IntroCinematicManager:new()
elseif RequiredScript:lower() == "lib/states/ingamewaitingforplayers" then
    Hooks:PostHook(IngameWaitingForPlayersState, "sync_start", "F_"..Idstring("PostHook:sync_start:IntroCinematicManager"):key(), function(self)          
        IntroCinematics.managers.introcinematics:play(self,managers.job:current_level_id())
    end)
    
    Hooks:PostHook(IngameWaitingForPlayersState, "at_exit", "F_"..Idstring("PostHook:at_exit:IntroCinematicManager"):key(), function(self)   
        IntroCinematics.managers.introcinematics:on_end()
    end)

    Hooks:PostHook(IngameWaitingForPlayersState, "_start_delay", "F_"..Idstring("PostHook:_start_delay:IntroCinematicManager"):key(), function(self)   
        IntroCinematics.managers.introcinematics:delay_hook()
    end)

elseif RequiredScript:lower() == "lib/managers/hud/hudmissionbriefing" then
    Hooks:PostHook(MissionBriefingGui, "init", "F_"..Idstring("PostHook:init:HideDefaultBlackScreen"):key(), function(self)
        IntroCinematics.managers.introcinematics:connect_mission_briefingui(self._safe_workspace,self._full_workspace)
    end)
elseif RequiredScript:lower() == "lib/managers/voicebriefingmanager" then
    Hooks:PostHook(VoiceBriefingManager, "_sound_callback", "F_"..Idstring("PostHook:_sound_callback:VoiceBriefingManager"):key(), function(self,instance, sound_source, event_type, cookie, label, identifier, position)
        IntroCinematics.managers.introcinematics:connect_mission_dialog_meta_data({
            instance = instance,
            sound_source = sound_source,
            event_type = event_type,
            cookie = cookie,
            label = label,
            identifier = identifier,
            position = position
        })    
    end)
elseif RequiredScript:lower() == "lib/managers/hud/hudblackscreen" then
    Hooks:PostHook(HUDBlackScreen, "set_job_data", "F_"..Idstring("PostHook:set_job_data:HideDefaultBlackScreen"):key(), function(self)
        local data = get_level_data(managers.job:current_level_id())
        if data then
            if self._blackscreen_panel:child("job_panel") then
                self._blackscreen_panel:child("job_panel"):set_visible(false)
            elseif self._blackscreen_panel:child("custom_job_panel") then -- Void UI fix
                self._blackscreen_panel:child("custom_job_panel"):set_visible(false)
            end
        else
            if self._blackscreen_panel:child("job_panel") then
                self._blackscreen_panel:child("job_panel"):set_visible(true)
            elseif self._blackscreen_panel:child("custom_job_panel") then -- Void UI fix
                self._blackscreen_panel:child("custom_job_panel"):set_visible(true)
            end
        end

        if self._blackscreen_panel:child("skip_text") and self._blackscreen_panel:child("custom_job_panel") then -- Void UI fix
            self._blackscreen_panel:child("skip_text"):set_center(self._blackscreen_panel:w() / 2, self._blackscreen_panel:h() / 1.05)
        end
    end)
end