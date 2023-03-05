function quick_rect(panel,size,...)
    local obj = ...

    if size ~= 256 and size ~= 128 and size ~= 64 and size ~= 32 and size ~= 16 then
        return
    end

    obj.texture = "thuverx/textures/rect_"..tostring(size or 128)

    return panel:bitmap(obj)
end

function quick_halfrect(panel,size,...)
    local obj = ...

    if size ~= 256 and size ~= 128 and size ~= 64 and size ~= 32 and size ~= 16 then
        return
    end

    obj.texture = "thuverx/textures/half_"..tostring(size or 128)

    return panel:bitmap(obj)
end

function createBackgroundPanel(panel,name,rect_size,size,offset,color_one,color_two)
    local bottom_rect = quick_rect(panel,rect_size,{
        name = name.."_bottom",
        w = size - offset * 0.5,
        h = size - offset * 0.5,
        x = offset,
        y = offset,
        color = color_two,
        alpha = 0.2
    })

    local top_rect = quick_rect(panel,rect_size,{
        name = name.."_top",
        w = size,
        h = size,
        color = color_one
    })  

    return {
        panel = panel,
        set_size = function(x)
            bottom_rect:set_w(x - offset * 0.5)
            bottom_rect:set_h(x - offset * 0.5)
            bottom_rect:set_left(offset)
            bottom_rect:set_top(offset)

            top_rect:set_w(x)
            top_rect:set_h(x)
        end
    }
end

function createShadowText(panel,opacity,offset,x)

    local obj = x

    local org_color = obj.color

    obj.name = (obj.name or "any").."_lower"

    obj.x = (obj.x or 0) + offset[1]
    obj.y = (obj.y or 0) + offset[2]
    obj.color = Color.black:with_alpha(opacity)

    local lower_text = panel:text(obj)

    obj.color = org_color
    obj.x = (obj.x or offset[1]) - offset[1]
    obj.y = (obj.y or offset[2]) - offset[2]

    obj.name = (obj.name or "any").."_upper"

    local upper_text = panel:text(obj)  

    return {
        upper_text = upper_text,
        lower_text = lower_text,
        set_text = function(text)
            upper_text:set_text(text)
            lower_text:set_text(text)
        end,
        set_color = function(color)
            upper_text:set_color(color)
        end,
        set_top = function(x) 
            upper_text:set_top(x)
            lower_text:set_top(x + offset[2])
        end,
        set_font_size = function(x)
            upper_text:set_font_size(x)
            lower_text:set_font_size(x)
        end,
        font_size = function()
            return upper_text:font_size()
        end,
        set_left = function(x) 
            upper_text:set_left(x)
            lower_text:set_left(x + offset[1])
        end,
        set_alpha = function(x) 
            upper_text:set_alpha(x)
            lower_text:set_alpha(x)
        end
    }
end


function debug_rect(ws,title,color)
    local panel = ws:panel({
        name = "debug_panel"
    })

    panel:rect({name = "DEBUG_RECT",color = color})
    panel:text({
        name = "DEBUG_RECT",
        text = title,
        align = "left",
        color = Color.white,
        font = "fonts/font_large_mf",
        font_size = 12
    })
end

function createVerticalText(panel,text,height,y,option)
    local _height = height
    local _y = y
    local els = {}
    local i = 0
    for c in text:gmatch"." do
        local ins = option
        ins.text = c
        ins.y = (_height * i) + _y or (option.font_size * i) + _y or (20 * i) + _y
        table.insert(els,panel:text(option))
        i = i + 1
    end

    return {
        elements = els,
        set_height = function(h)
            _height = h
            
        end,
        set_y = function(y)
            _y = y
        end,
        render = function()
            for i,item in pairs(els) do
                item:set_y(_height * (i-1) + _y)
            end
        end,
        element_height = function()
            return _height
        end
    }
end