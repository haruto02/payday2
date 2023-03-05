function cord_tostring(cord)
    return "{"..tostring(cord[1])..","..tostring(cord[2]).."}"
end

local rt_swap = {
	{
		Idstring("Text"),
		Idstring("OverlayText")
	},
	{
		Idstring("VertexColor"),
		Idstring("OverlayVertexColor")
	},
	{
		Idstring("VertexColorTextured"),
		Idstring("OverlayVertexColorTextured")
	},
	{
		Idstring("VertexColorTexturedAlphaSweep"),
		Idstring("OverlayVertexColorTexturedAlphaSweep")
	},
	{
		Idstring("VertexColorTexturedRadial"),
		Idstring("OverlayVertexColorTexturedRadial")
	},
	{
		Idstring("VertexColorTexturedMaskRender"),
		Idstring("OverlayVertexColorTexturedMaskRender")
	},
	{
		Idstring("VertexColorTexturedBlur3D"),
		Idstring("OverlayVertexColorTexturedBlur3D")
	}
}

if not Hologram then
    Hologram = class()

    function Hologram:init(options)        
        self.options = options
        if not self.options.name then
            self.options.name = "UNNAMED_HOLOGRAM"
        end
        self.options.name = Idstring(self.options.name)
        self.options.world_rot = self.options.world_rot or Rotation(0,0,0)
        self.options.world_pos = self.options.world_pos or Vector3(0,0,0)
        self.options.world_size = self.options.world_size or {100,100}
        self.options.size = self.options.size or {100,100}
        self.options.offset = self.options.offset or {0,0,0}
        self.options.forward_offset = self.options.forward_offset or 0
        if self.options.gui then
            self._gui = self.options.gui
        else
            self._gui = World:newgui()
        end
        self.dead = false
        
        local world_width = Vector3(0, self.options.world_size[1], 0):rotate_with(self.options.world_rot)
	    local world_height = Vector3(0, 0, -self.options.world_size[2]):rotate_with(self.options.world_rot)
        self.hologram = self._gui:create_world_workspace(self.options.size[1], self.options.size[2], self.options.world_pos, world_width, world_height)

        self.panel = self.hologram:panel({
            name = "hologram_panel"
        })

        if self.options.unit and not self.options.manual_link then

            local root = self.options.unit

            if self.options.unit.orientation_object and not self.options.skip_oo then
                root = self.options.unit:orientation_object()
            end

            local pos = root:position() - Vector3(-self.options.offset[1],self.options.forward_offset + self.options.offset[3],  self.options.offset[2]):rotate_with(root:rotation())
            local _w = Vector3(self.options.world_size[1], 0, 0):rotate_with(root:rotation())
            local _h = Vector3(0, 0, -self.options.world_size[2]):rotate_with(root:rotation())

            self.hologram:set_linked(self.options.size[1], self.options.size[2], root, pos, _w, _h)
        end

        if self.options.debug then
            self.DEBUG_RECT = self.panel:rect({name = "DEBUG_RECT",color = Color.red})
            self.DEBUG_TEXT = self.panel:text({
                name = "DEBUG_RECT",
                text = self.options.debug_text or self:tostring(),
                align = "left",
                color = Color.white,
                layer = 9,
                font = "fonts/font_large_mf",
                font_size = 12
            })

            self:enable_overlay()
            self:disable_depth()
        end

        if self.options.billboard then
            self.hologram:set_billboard(self.options.billboard)
        end
    end

    function Hologram:enable_overlay(panel)
        local objects = {
            panel or self.hologram:panel(),
            self.panel
        }
        local i = 1
    
        while #objects > 0 do
            local object = objects[#objects]
    
            table.remove(objects)
    
            if object.type_name == "Panel" then
                local children = object:children()
    
                for _, o in ipairs(children) do
                    table.insert(objects, o)
                end
            else
                local rt = object:render_template()
                local swap = nil
    
                for _, s in ipairs(rt_swap) do
                    if s[1] == rt then
                        object:set_render_template(s[2])
    
                        break
                    end
                end
            end
        end
    end

    function Hologram:disable_depth(panel)
        local objects = {
            panel or self.hologram:panel(),
            self.panel
        }
    
        while #objects > 0 do
            local object = table.remove(objects)
    
            if object.type_name == "Panel" then
                local children = object:children()
    
                for _, o in ipairs(children) do
                    table.insert(objects, o)
                end
            else
                object:configure({
                    depth_mode = "disabled"
                })
            end
        end
    end

    function Hologram:update(t,dt)
        if self.options.update then
            self.options.update(t,dt)
        end
    end

    function Hologram:workspace()
        return self.hologram
    end

    function Hologram:destroy()
        self.dead = true
    end

    function Hologram:is_dead()
        return self.dead
    end

    function Hologram:tostring()
        if not self.options.unit then
            return "world_pos= "..tostring(self.options.world_pos).." world_rot= "..tostring(self.options.world_rot).." world_size= "..cord_tostring(self.options.world_size).." size= "..cord_tostring(self.options.size)
        end
        return "world_pos= "..tostring(self.options.unit:position()).." world_rot= "..tostring(self.options.world_rot).." world_size= "..cord_tostring(self.options.world_size).." size= "..cord_tostring(self.options.size)
    end
    function Hologram:get_panel()
        return self.panel
    end

    function Hologram:name()
        return self.options.name
    end
end


if not HologramManager then
    HologramManager = class()

    function HologramManager:init() 
        self._name = "HologramManager"

        self.instances = {}
    end

    function HologramManager:create(options)
        local holo = Hologram:new(options)
        table.insert(self.instances, holo)
        return holo
    end

    function HologramManager:update(t,dt)
        for _,instance in pairs(self.instances) do
            if instance and not instance:is_dead() then
                instance:update(t,dt)
            end
        end
    end
end

IntroCinematics.managers.holograms = IntroCinematics.managers.holograms or HologramManager:new()