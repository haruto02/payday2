_include("utils/Easing.lua")
_include("utils/panels.lua")

function clamp(n,l,h)
    l = l or 0
    h = h or 1
    return math.max(l,math.min(h,n))
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function IntroCinematicDifficultyHologram(panel,data)
    local difficulty_panel = panel:panel({
        name = "difficulty_panel",
        h = data.size
    })

    local is_crime_spree = managers.crime_spree:current_mission() ~= nil

    if not is_crime_spree then

        local heist_name = createShadowText(difficulty_panel,0.5,{5,5},{
            name = "heist_name",
            vertical = "top",
            align = "left",
            text = data.heist_name,
            visible = true,
            h = difficulty_panel:h() * 0.5,
            layer = 4,
            color = data.main_color,
            font_size = difficulty_panel:h() * 0.5 * data.title_font_size,
            font = data.font
        })

        local risk_text = createShadowText(difficulty_panel,0.5,{5,5},{
            vertical = "top",
            align = "left",
            y = difficulty_panel:h() * 0.45 * data.title_font_size,
            text = managers.localization:text(tweak_data.difficulty_name_ids[tweak_data.difficulties[data.difficulty + 2]]),
            font = data.font,
            font_size = difficulty_panel:h() * 0.3 * data.difficulty_font_size,
            color = data.risk_color
        })

        local skulls_panel = difficulty_panel:panel({
            name = "skulls_panel",
            y = difficulty_panel:h() * 0.45 * data.title_font_size + difficulty_panel:h() * 0.3 * data.difficulty_font_size,
            h = difficulty_panel:h() * 0.2 * data.difficulty_icon_size
        })

        local blackscreen_risk_textures = tweak_data.gui.blackscreen_risk_textures

        for i = 1, data.difficulty, 1 do
            local difficulty_name = tweak_data.difficulties[i + 2]
            local texture = blackscreen_risk_textures[difficulty_name] or "guis/textures/pd2/risklevel_blackscreen"
            skulls_panel:bitmap({
                name = "risk_level_"..tostring(i),
                texture = texture,
                color = data.risk_color,
                x = skulls_panel:h() * (i-1),
                w = skulls_panel:h(),
                h = skulls_panel:h(),
                alpha = 1
            })
        end

        return function(s,t,dt)
            risk_text.set_left(math.lerp(-1300,0,(t-s) < 3 and clamp(Easing.easeOutQuart((t - s - 3))) or 1))
            heist_name.set_top(math.lerp(-1300,0,(t-s) < 2 and clamp(Easing.easeOutQuart((t - s - 2))) or 1))
            for i = 1, data.difficulty, 1 do
                local element = skulls_panel:child("risk_level_"..tostring(i))
                if element then 
                    element:set_top(math.lerp(-element:h(),0,(t-s) < 4.4 and clamp(Easing.easeOutQuart((t - s - 4 - (i*0.1)))) or 1))
                end
            end
        end
    else
        local crime_spree_amount = managers.crime_spree:spree_level()
        local icon = difficulty_panel:panel({
            name = "crime_spree_icon_panel",
            y = difficulty_panel:w() / 6,
            w = difficulty_panel:h(),
            h = difficulty_panel:h(),
            alpha = 1
        })

        local spree_amount = createShadowText(difficulty_panel,0.5,{5,5},{
            vertical = "center",
            align = "left",
            x = difficulty_panel:w() / 6 + difficulty_panel:h() / 1.5,
            h = difficulty_panel:h(),
            text = tostring(0),
            font = "thuverx/fonts/notosans/noto_sans_numbers",
            font_size = difficulty_panel:h() * 0.8,
            color = data.risk_color
        })

        local top = difficulty_panel:bitmap({
            name = "crime_spree_icon_top",
            texture = "introcinematics/textures/cs_top",
            color = data.risk_color,
            w = icon:h(),
            h = icon:h(),
            alpha = 1
        })

        local mid = difficulty_panel:bitmap({
            name = "crime_spree_icon_mid",
            texture = "introcinematics/textures/cs_mid",
            color = data.risk_color,
            w = icon:h(),
            h = icon:h(),
            alpha = 1
        })

        local bot = difficulty_panel:bitmap({
            name = "crime_spree_icon_bot",
            texture = "introcinematics/textures/cs_bot",
            color = data.risk_color,
            w = icon:h(),
            h = icon:h(),
            alpha = 1
        })

        local face = difficulty_panel:bitmap({
            name = "crime_spree_icon_face",
            texture = "introcinematics/textures/cs_face",
            color = data.risk_color,
            w = icon:h(),
            h = icon:h(),
            alpha = 1
        })


        return function(s,t,dt)
            t = t - 2
            top:set_top(math.lerp(-icon:h(),0,(t-s) < 1.1 and clamp(Easing.easeOutQuart((t - s - 0.85 - (0.4)))) or 1))
            mid:set_top(math.lerp(-icon:h(),0,(t-s) < 1.1 and clamp(Easing.easeOutQuart((t - s - 0.85 - (0.3)))) or 1))
            bot:set_top(math.lerp(-icon:h(),0,(t-s) < 1.1 and clamp(Easing.easeOutQuart((t - s - 0.85 - (0.1)))) or 1))

            spree_amount.set_left(math.lerp(-icon:h(),difficulty_panel:w() / 6 + difficulty_panel:h() / 1.5,(t-s) < 1 and clamp(Easing.easeOutQuart((t - s - 1))) or 1))
            spree_amount.set_alpha((t-s) < 1 and clamp(Easing.easeOutQuart((t - s - 1) * 2)) or 1)
            spree_amount.set_font_size(math.lerp(difficulty_panel:h() * 1.4,difficulty_panel:h() * 0.8,(t-s) < 0.9 and clamp(Easing.easeOutQuart((t - s - 0.9) * 2)) or 1))

            spree_amount.set_text(tostring(math.floor(clamp(math.lerp(0,crime_spree_amount,1 - Easing.easeOutQuart((t - s + 3) * 0.3)), 0, crime_spree_amount))))

            face:set_alpha((t-s) < 1.65 and clamp(Easing.easeOutQuart((t - s - 1.65) * 3)) or 1)

            face:set_x(math.lerp(-icon:h() / 2,0,(t-s) < 1.6 and clamp(Easing.easeOutQuart((t - s - 1.6) * 4)) or 1))
            face:set_y(math.lerp(-icon:h() / 2,0,(t-s) < 1.6 and clamp(Easing.easeOutQuart((t - s - 1.6) * 4)) or 1))
            face:set_w(math.lerp(icon:h() * 2,icon:h(),(t-s) < 1.6 and clamp(Easing.easeOutQuart((t - s - 1.6) * 4)) or 1))
            face:set_h(math.lerp(icon:h() * 2,icon:h(),(t-s) < 1.6 and clamp(Easing.easeOutQuart((t - s - 1.6) * 4)) or 1))
        end
    end
end
