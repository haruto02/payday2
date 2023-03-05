if not _b then
    function _b(x)
        return x - 0.0001
    end
end

Hooks:PostHook(LevelsTweakData, "init", "F_"..Idstring("PostHook:init:LevelsTweakData"):key(), function(self)
    --[[
    Progress:

    ✅  Art Gallery             - gallery
    ✅  Firestarter             - firestarter
    ✅  Rats                    - alex
    ✅  Big Oil                 - welcome_to_the_jungle
    ✅  Framing Frame           - framing_frame
    ✅  Watchdogs               - watchdogs
    ✅  Nightclub               - nightclub
    ✅  Ukrainian job           - ukrainian_job
    ✅  Jewelry store           - jewelry_store
    ✅  Four stores             - four_stores
    ✅  Mallcrasher             - mallcrasher
    ✅  Bank heist              - branchbank
    ✅  Election day            - election_day
    ✅  Shadow Raid             - kosugi                    // How did I miss this??
    ❌  Safehouse               - safehouse                 // Old, not needed
    ✅  Transport: Crossroads   - arm_cro
    ✅  Transport: Underpass    - arm_und
    ✅  Transport: Downtown     - arm_hcm                   // Don't know if I like this one
    ✅  Transport: Park         - arm_par
    ✅  Transport: Harbor       - arm_fac
    ✅  Transport: Train heist  - arm_for
    ✅  Cook off                - rat
    ✅  Diamond Store           - family
    ✅  The big Bank            - big
    ✅  GO Bank                 - roberts
    ✅  Hotline Miami           - mia
    ✅  Hoxton breakout         - hox
    ✅  White Xmas              - pines
    ✅  The Diamond             - mus
    ✅  Car shop                - cage
    ✅  Hoxton revenge          - hox_3
    ✅  The Bomb: Dockyard      - crojob2
    ✅  The Bomb: Forest        - crojob3
    ✅  Meltdown                - shoutout_raid
    ✅  The Alesso Heist        - arena
    ✅  Golden Grin Casino      - kenaz
    ✅  Aftershock              - jolly
    ✅  First World Bank        - red2
    ✅  Slaughterhouse          - dinner
    ✅  Beneath The Mountain    - pbr
    ✅  Birth Of Sky            - pbr2
    ✅  Goat Simulator          - peta
    ✅  Counterfeit             - pal
    ✅  Undercover              - man
    ✅  Boiling Point           - mad
    ✅  Murky Station           - dark
    ✅  The Bike Heist          - born
    ❌  Safe House              - chill
    ✅  Safe House Raid         - chill_combat
    ✅  Scarface Mansion        - friend
    ✅  Panic Room              - flat
    ✅  Prison Nightmare        - help
    ✅  Safe House Nightmare    - haunted
    ✅  Brooklyn 10-10          - spa
    ✅  The Yacht Heist         - fish
    ✅  Stealing XMAS           - moon
    ❌  Heat Street             - run                       // Too big, causes crashes
    ✅  Green Bridge            - glace
    ✅  Diamond Heist           - dah
    ✅  Reservoir Dogs Heist    - rvd
    ✅  Cursed Kill Room        - hvh
    ✅  Alaskan Deal            - wwh
    ✅  Brooklyn Bank           - brb
    ✅  Breakin' Feds           - tag
    ✅  Henry's Rock            - des
    ✅  No mercy                - nmh
    ✅  Shacklethorne Auction   - sah
    ❌  The White House         - vit                       // Too much story, too long wont work
    ✅  Hell's Island           - bph
    ✅  Border Crossing         - mex
    ✅  Border Crystals         - mex_cooking
    ✅  San Martin Bank         - bex
    ✅  Breakfast in Tijuana    - pex
    ✅  Buluc's Mansion         - fex
    ✅  Dragon Heist            - chas
    ✅  The Ukrainian Prisoner  - sand
    ✅  Black Cat               - chca
    ✅  Mountain Master         - pent
    ✅  Midland Ranch           - ranc
    ✅  Lost in Transit         - trai

    ]]

    self.gallery.cine_data = {
        timeline = {
            [0] = {
                path = {
                    Vector3(5215.68, -1655.32, 552.688),
                    Rotation(73.0962, -72.5336, -3.41509e-006)
                },
                easing = "easeOutQuad"
            },
            [100] = {
                path = {
                    Vector3(3890.6, -632.12, 1109.13) ,
                    Rotation(74.4981, -18.0499, -8.53774e-007)
                }
            }
        },
        length = 10,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            align = "billboard_x",
            pos = Vector3(1577.95, -603.208, 966.784),
            start = 40
        }
    }

    self.firestarter_1.cine_data = {
        timeline = {
            [0] = {
                path = {
                    Vector3(-9647.3, 4865.12, 1146.54),
                    Rotation(-97.4522, 2.11352, 2.13443e-007)
                }
            },
            [33] = {
                fade_out = 2
            },
            [_b(35)] = {
                path = {
                    Vector3(-7950.97, 4727.44, 1131.11),
                    Rotation(-92.2025, -2.43648, -0)
                },
                lerp = false,
                blackscreen = true
            },
            [35] = {
                path = {
                    Vector3(-4290.21, 6808.47, 1282.49),
                    Rotation(-163.254, -5.58678, 1.60083e-007)
                },
                fade_in = 2
            },
            [57] = {
                fade_out = 2
            },
            [_b(60)] = {
                path = {
                    Vector3(-4559.86, 6733.32, 1204.14),
                    Rotation(-155.204, -1.38696, -5.33608e-008)
                },
                lerp = false,
                blackscreen = true
            },
            [60] = {
                path = {
                    Vector3(-1588.55, -417.668, 1040.25),
                    Rotation(-25.0047, -18.8873, 4.26887e-007)
                },
                fade_in = 2
            },
            [100] = {
                path = {
                    Vector3(788.338, -1326.03, 1107.24),
                    Rotation(8.9453, -17.8373, -2.13443e-007)
                }
            }
        },
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            align = "billboard_x",
            pos = Vector3(-426.62, 0, 796.766),
            start = 55
        }
    }

    self.firestarter_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(2295.81, 3664.06, 1687.25),Rotation(-177.112, -16.6512, -1.33402e-007)}
            },
            [45] = {
                fade_out = 2
            },
            [_b(50)] = {
                path = {Vector3(2121.9, 3811.76, 1687.25),Rotation(120.938, -15.6012, -8.53774e-007)},
                lerp = false,
                blackscreen = true
            },
            [50] = {
                fade_in = 2,
                path = {Vector3(-804.841, 2014.39, 142.871),Rotation(179.389, 47.7487, -2.66804e-008)},
            },
            [100] = {
                path = {Vector3(-844.454, 1301.83, 153.393),Rotation(-179.912, 4.3487, -2.08441e-010)}
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            align = "billboard_x",
            pos = Vector3(-1043.506, 186.736, 300.168),
            start = 55
        }
    }

    self.firestarter_3.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1553.33, -231.955, 109.647),Rotation(48.0495, 7.26704, 2.13443e-007)},
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(-1997, -871.43, 70.6471),Rotation(-21.961, 2.94888, -0)}
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(-90,0,0),
            pos = Vector3(-1739.93, -100, 223.572),
            start = 55
        }
    }

    self.alex_1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3288.22, -2557.23, 3383.39),Rotation(-51.0034, -30.3002, 1.70755e-006)},
                fov = 60
            },
            [44] = {
                fade_out = 2
            },
            [_b(50)] = {
                path = {Vector3(-1327.8, -796.254, 2575.63),Rotation(-61.1539, -28.5505, -0)},
                lerp = false,
                blackscreen = true,
                fov = 80
            },
            [50] = {
                fade_in = 2,
                path = {Vector3(706.598, 1758.97, 1251.46),Rotation(-126.605, 0.149054, 2.00103e-008)}
            },
            [100] = {
                path = {Vector3(561.103, 1245.88, 1712.26),Rotation(-115.756, 13.0992, -2.13443e-006)}
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(90,0,0),
            pos = Vector3(1333.49, 775.349, 1891.1),
            start = 65
        }
    }

    self.alex_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1449.78, 2016.03, -444.422),Rotation(-15.527, 0.029335, -0)},
                units = {
                    ["gangster_1"] = {
                        id = "introcinematics/units/alex_2/ene_gang_black_1/ene_gang_black_1",
                        position = Vector3(1481.01, 2527.39, -598.76),
                        rotation = Rotation(133, 0, -0)
                    },
                    ["gangster_2"] = {
                        id = "introcinematics/units/alex_2/ene_gang_black_3/ene_gang_black_3",
                        position = Vector3(1650.81, 2387.53, -598.76),
                        rotation = Rotation(110, -0, -0)
                    },
                    ["gangster_3"] = {
                        id = "introcinematics/units/alex_2/ene_gang_black_3/ene_gang_black_3",
                        position = Vector3(1087.74, 3050.94, -598.76),
                        rotation = Rotation(-177, 0, -0)
                    }
                },
                fov = 30
            },
            [100] = {
                path = {Vector3(402.794, -1752.38, -446.424),Rotation(-15.527, 0.029335, -0)}
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(-90,0,0),
            pos = Vector3(552.352, -188.861, -434.13),
            start = 65
        }
    }

    self.alex_3.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(25215.6, 24230, 5575.87),Rotation(91.6356, -58.3003, 1.70755e-006)},
                fov = 40,
                easing = "easeOutQuad",
                shakers = {
                    ["helicopter_cam"] = {
                        id = "breathing",
                        params = {20}
                    }
                }
            },
            [100] = {
                path = {Vector3(13105.2, 24300.1, 6915.22),Rotation(90.9363, -61.1006, 1.70755e-006)},
                fade_out = 0.5
            }
        },
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(0,0,-90),
            pos = Vector3(10541.94, 24069.5, 2814.03),
            start = 70
        }
    }


    self.welcome_to_the_jungle_1_night.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(5909.51, 4284.38, 108.759),Rotation(152.073, -61.8002, -3.41509e-006)},
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(-63.1322, -2044.24, 1264.73),Rotation(-117.277, -15.6004, -8.53774e-007)},
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            align = "billboard_x",
            pos = Vector3(933.47, -3129.32, 828.929),
            start = 50
        }
    }
    self.welcome_to_the_jungle_1.cine_data = deep_clone(self.welcome_to_the_jungle_1_night.cine_data)

    self.welcome_to_the_jungle_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-6333.82, 1464.07, 223.942),Rotation(-108.122, -9.99836, -0)}
            },
            [45] = {
                fade_out = 2
            },
            [_b(50)] = {
                path = {Vector3(-5406.64, -191.95, 1669.06),Rotation(-102.872, -22.9485, -0)},
                lerp = false,
                blackscreen = true
            },
            [50] = {
                fade_in = 1,
                path = {Vector3(1105.95, -1724.77, 544.805),Rotation(42.2263, -4.40026, -2.13443e-007)},
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(-1012.11, -1639.85, 634.778),Rotation(-65.2239, -9.65032, 4.26887e-007)},
            }
        },
        length = 22,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(-180,0,0),
            pos = Vector3(-193.05, -750.44, 515.786),
            start = 65
        }
    }

    self.framing_frame_1.cine_data = deep_clone(self.gallery.cine_data)
    self.framing_frame_1.cine_data.length = 20
    self.framing_frame_1.cine_data.hologram.start = 50

    self.framing_frame_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(759.136, -796.573, -190.081),Rotation(136.519, -75.4504, -1.70755e-006)},
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(942.025, -454.13, 662.229),Rotation(150.519, -4.05069, -1.06722e-007)}
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(90,0,0),
            pos = Vector3(614.035, -1278.72, 642.364),
            start = 45
        }
    }

    self.framing_frame_3.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-4015.58, 4617.19, 3131.64),Rotation(-7.47217, 15.2507, 2.13443e-007)},
                easing = "easeOutQuad"
            },
            [60] = {
                path = {Vector3(-4208.33, 164.784, 3217.57),Rotation(-2.57233, -1.19939, -0)},
                easing = "easeInOutQuad"
            },
            [100] = {
                path = {Vector3(-4274.2, -651.644, 2957.62),Rotation(-7.12235, 20.5007, -1.06722e-007)}
            }
        },
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(-90,0,0),
            pos = Vector3(-4120.51, 428.321, 3439.63),
            start = 60
        }
    }

    self.watchdogs_1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(3615.73, 2846.4, 30),Rotation(-94.8047, 13,0)},
                fov = 30,
                easing = "easeOutQuad",
                units = {
                    ["player_truck"] = {
                        id = "introcinematics/units/watchdogs_1/str_vehicle_truck_boxvan/str_vehicle_truck_boxvan_player_edition",
                        position = Vector3(-2000, -16850, 0),
                        rotation = Rotation(0,0,0)
                    },
                    ["cop_car_1"] = {
                        id = "introcinematics/units/watchdogs_1/str_vehicle_car_police_washington/str_vehicle_car_police_washington",
                        position = Vector3(-2180, -16850, 100),
                        rotation = Rotation(0,0,0)
                    },
                    ["cop_car_2"] = {
                        id = "introcinematics/units/watchdogs_1/str_vehicle_car_police_washington/str_vehicle_car_police_washington",
                        position = Vector3(-2180, -16850, 100),
                        rotation = Rotation(0,0,0)
                    },
                    ["cop_car_3"] = {
                        id = "introcinematics/units/watchdogs_1/str_vehicle_car_police_washington/str_vehicle_car_police_washington",
                        position = Vector3(-2180, -16850, 100),
                        rotation = Rotation(0,0,0)
                    }
                },

                lights = {
                    ["cop_lights1"] = {
                        type = "omni|specular",
                        special = "cop_light",
                        color = Vector3(1,0,0),
                        position = Vector3(4380, 2330.69, 242.058),
                        far_range = 1000
                    },
                    ["cop_lights2"] = {
                        type = "omni|specular",
                        special = "cop_light",
                        color = Vector3(1,0,0),
                        position = Vector3(4380, 2330.69, 242.058),
                        far_range = 1000
                    },
                    ["cop_lights3"] = {
                        type = "omni|specular",
                        special = "cop_light",
                        color = Vector3(1,0,0),
                        position = Vector3(4380, 2330.69, 242.058),
                        far_range = 1000
                    }
                }
            },
            [27] = {
                effects = {
                    ["truck_floor"] = {
                        effect = "effects/payday2/particles/explosions/smoke_explosion/dark_smoke_big",
                        position = Vector3(4600,2400,10),
                        normal = Vector3(0,1,1)
                    }
                },
                shakers = {
                    ["truck_driveby"] = {
                        id = "whizby",
                        params = {0.5,0.1}
                    }
                }
            },
            [34] = {
                delete_effects = {
                    "truck_floor"
                },
                effects = {
                    ["cop_floor1"] = {
                        effect = "effects/payday2/particles/explosions/smoke_explosion/dark_smoke_big",
                        position = Vector3(4580,2400,5),
                        normal = Vector3(0,1,0.2)
                    }
                },
                shakers = {
                    ["cop_driveby1"] = {
                        id = "player_land",
                        params = {0.07,0.1}
                    }
                }
            },
            [43] = {
                delete_effects = {
                    "cop_floor1"
                },
                shakers = {
                    ["cop_driveby2"] = {
                        id = "player_land",
                        params = {0.07,0.1}
                    }
                }
            },
            [44.5] = {
                effects = {
                    ["cop_floor3"] = {
                        effect = "effects/payday2/particles/explosions/smoke_explosion/dark_smoke_big",
                        position = Vector3(4580,2400,-15),
                        normal = Vector3(0,1,0.1)
                    }
                },
                shakers = {
                    ["cop_driveby3"] = {
                        id = "player_land",
                        params = {0.07,0.1}
                    }
                }
            },
            [60] = {
                delete_lights = {
                    "cop_lights1",
                    "cop_lights2",
                    "cop_lights3"
                }
            },
            [100] = {
                path = {Vector3(3551.05, 2076.94, 30),Rotation(-94.8047, 7,0)},
                fov = 30,
                fade_out = 2
            }
        },
        update = [[
            self.mem.units["player_truck"]:set_position(Vector3(4600, 10000 *  (local_progress * 4.3) - 10000, -20 - math.sin(t*100000+24892) * 0.5))
            self.mem.units["cop_car_1"]:set_position(Vector3(4580, 10000 *  (local_progress * 4.2) - 2200 - 10000, -20 - math.sin(t*100000) * 0.2))
            self.mem.units["cop_car_2"]:set_position(Vector3(4380, 10000 *  (local_progress * 4.1) - 3200 - 10000, -20 - math.sin(t*100000+29823) * 0.2))
            self.mem.units["cop_car_3"]:set_position(Vector3(4580, 10000 *  (local_progress * 4) - 5200 - 10000, -20 - math.sin(t*100000+2913) * 0.2))
        
            if self.mem.special_lights["cop_lights1"] then
                self.mem.special_lights["cop_lights1"].light:set_position(Vector3(4580, 10000 *  (local_progress * 4.2) - 2200 - 10000, 300))
                self.mem.special_lights["cop_lights2"].light:set_position(Vector3(4580, 10000 *  (local_progress * 4.1) - 3200 - 10000, 300))
                self.mem.special_lights["cop_lights3"].light:set_position(Vector3(4580, 10000 *  (local_progress * 4) - 5200 - 10000,300))
            end
        ]],
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(-180,0,0),
            pos = Vector3(4886.33, 2330.69, 242.058),
            start = 18
        }
    }
    self.watchdogs_1_night.cine_data = deep_clone(self.watchdogs_1.cine_data)

    self.watchdogs_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-7018.86, -7007.44, 9538.04),Rotation(-42.852, -46.8646, -1.70755e-006)},
                fov = 20,
                shakers = {
                    ["helicopter_cam"] = {
                        id = "breathing",
                        params = {40}
                    }
                }
            },
            [45] = {
                fade_out = 2
            },
            [_b(50)] = {
                kill_shakers = {
                    "helicopter_cam"
                },
                path = {Vector3(-1606.46, -8142.24, 10206),Rotation(-29.5521, -49.665, 8.53774e-007)},
                lerp = false,
                blackscreen = true
            },
            [50] = {
                path = {Vector3(-3046.61, 1792.27, 1283.01),Rotation(-103.403, -12.9153, -0)},
                fade_in = 2,
                fov = 60
            },
            [100] = {
                path = {Vector3(-1139.11, 3477.59, 1189.75),Rotation(-138.753, -11.5153, 8.53774e-007)}
            }
        },
        length = 22,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            align = "billboard_x",
            pos = Vector3(727.518, 847.457, 707.638),
            start = 50
        }
    }
    self.watchdogs_2_day.cine_data = deep_clone(self.watchdogs_2.cine_data)

    self.nightclub.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1547.16, -4112.93, 166.049),Rotation(-152.352, -8.6004, -6.4033e-007)},
                units = {
                    ["bouncer"] = {
                        id = "introcinematics/units/nightclub/ene_gang_russian_2/ene_gang_russian_2",
                        position = Vector3(1647.47, -4294.98, -25),
                        rotation = Rotation(-1, 0, -0)
                    }
                }
            },
            [47] = {
                fade_out = 1
            },
            [_b(50)] = {
                path = {Vector3(1397.17, -3754.99, 187.665),Rotation(-155.152, -5.10071, -1.06722e-007)},
                lerp = false,
                blackscreen = true
            },
            [50] = {
                fade_in = 1,
                path = {Vector3(2175.42, -5040.63, 303.493),Rotation(-121.553, -11.0509, -8.53774e-007)}
            },
            [100] = {
                path = {Vector3(1839.18, -6277.49, 545.211),Rotation(-57.5035, -13.8511, -4.26887e-007)}
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-180,0,0),
            pos = Vector3(2578.15, -5536.31, 480.85),
            start = 70
        }
    }

    self.ukrainian_job.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1159.83, 1415.09, 185.881),Rotation(142.023, -40.7037, 8.53774e-007)},
                easing = "easeInOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(-928.404, 2554.88, 780.882),Rotation(-148.047, -8.6011, -0)},
                fov = 80
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-180,0,0),
            pos = Vector3(388.064, 2086.67, 673.363),
            start = 60
        }
    }

    self.jewelry_store.cine_data = deep_clone(self.ukrainian_job.cine_data)


    self.four_stores.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(4352.15, -3401.17, 558.974),Rotation(-89.551, 2.59863, -0)},
                fov = 40
            },
            [100] = {
                path = {Vector3(-3669.06, -3395.37, 365.423),Rotation(-89.9011, 1.54863, 5.33608e-008)},
                fov = 40
            }
        },
        length = 17,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-180,0,0),
            pos = Vector3(-1000, -3091.64, 423.848),
            start = 50
        }
    }

    self.mallcrasher.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-471.909, -266.679, 178.851),Rotation(175.459, 0.129553, -1.25064e-009)},
                fov = 70
            },
            [100] = {
                path = {Vector3(-840.268, -585.743, 665.602),Rotation(-151.641, -2.67081, -1.60083e-007)},
                fov = 70
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(90,0,0),
            pos = Vector3(-249.227, -1291.02, 752),
            start = 50
        }
    }

    self.branchbank.cine_data = deep_clone(self.firestarter_3.cine_data)

    self.election_day_1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(5843.08, -3858.94, 208.139),Rotation(-121.83, -8.60035, -8.53774e-007)},
                units = {
                    ["boat"] = {
                        id = "introcinematics/units/election_day_1/gen_vehicle_cocaineboat/gen_vehicle_cocaineboat",
                        position = Vector3(19151.5, -6217.28, -254),
                        rotation = Rotation(14, -0, -0)
                    }
                }
            },
            [100] = {
                path = {Vector3(4735.72, -3609.75, 1404.43),Rotation(20.6196, -10.3503, -0)}
            }
        },
        update = [[
            local pos = Vector3(0,0,0)
            local rot = Rotation(0,0,0)

            mvector3.lerp(pos,
                Vector3(19151.5, -6217.28, -254),
                Vector3(5745.67, -7476.58, -254),
                local_progress * 2)
            mrotation.slerp(rot,
                Rotation(14, -0, -0),
                Rotation(-4, 0, -0),
                local_progress * 2)

            self.mem.units["boat"]:set_position(pos)
            self.mem.units["boat"]:set_rotation(rot)
        ]],
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(4729.73, -2363.64, 1091.02),
            start = 50
        }
    }

    self.election_day_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-4351.03, 2416.18, 285.897),Rotation(-124, -6.15015, -6.4033e-007)},
                easing = "easeOutQuad",
                units = {
                    ["van"] = {
                        id = "introcinematics/units/global/str_vehicle_van_player/str_vehicle_van_player",
                        position = Vector3(-4033, 2174, 5),
                        rotation = Rotation(90, -0, -0)
                    }
                }
            },
            [100] = {
                path = {Vector3(-341.104, 2215.53, 615.084),Rotation(-175.949, -0.364321, 8.33763e-010)}
            }
        },
        update = [[
            local pos = Vector3(0,0,0)

            mvector3.lerp(pos,
                Vector3(-4033, 2174, -20),
                Vector3(-540.997, 2174, -20),
                Easing.easeOutQuad(local_progress + 0.3))

            self.mem.units["van"]:set_position(pos)
        ]],
        length = 14,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(90,0,0),
            pos = Vector3(159.869, 1257.54, 708.782),
            start = 60
        }
    }

    self.election_day_3_skip1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-237.497, -1131.55, 206.061),Rotation(-46.5069, 3.99992, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(-532.865, -1006.1, 206.061),Rotation(-3.45698, 8.89994, 2.66804e-008)},
                fov = 60
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 450,
            rot = Rotation(-90,0,0),
            pos = Vector3(-713.338, -181.91,360),
            start = 50
        }
    }

    self.election_day_3.cine_data = deep_clone(self.election_day_3_skip1.cine_data)
    self.election_day_3_skip2.cine_data = deep_clone(self.election_day_3_skip1.cine_data)

    self.arm_cro.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-2397.73, 1951.87, 131.463),Rotation(168.077, 7.84976, -1.06722e-007)},
                easing = "easeOutQuad",
                fov = 20,
                script = [[
                    self.mem.custom["sniper_line"] = Draw:brush(Color.red:with_alpha(0.3))
                    self.mem.custom["sniper_line"]:set_blend_mode("opacity_add")
                ]],
                units = {
                    ["transport"] = {
                        id = "introcinematics/units/arm_cro/vehicle_truck_gensec_transport/str_vehicle_truck_gensec_transport",
                        rotation = Rotation(90, -0, -0)
                    }
                }
            },
            [66] = {
                blackscreen = true
            },
            [100] = {
                path = {Vector3(-2677.76, 2004.41, 131.156),Rotation(174.377, 5.39977, -0)},
                fov = 20,
                blackscreen = true
            }
        },
        update = [[
            local pos = Vector3(0,0,0)

            mvector3.lerp(pos,
                Vector3(-8077, 9, -20),
                Vector3(-2597, 9, -20),
                local_progress * 3 - 0.2)

            self.mem.units["transport"]:set_position(pos)

            local sniper_hit = Vector3(58.2023, 2861.24, 125.804)

            mvector3.lerp(sniper_hit,
                Vector3(58.2023, 2861.24, 125.804),
                pos + math.UP * 200,
                math.min(1,local_progress * 2.5))

            self.mem.custom["sniper_line"]:cylinder(Vector3(822.059, -1010.91, 1050.25),sniper_hit, 0.5)
            
        ]],
        length = 10,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 200,
            rot = Rotation(90,0,0),
            pos = Vector3(-2574.64, 1412.65, 230.971),
            start = 10
        }
    }

    self.arm_und.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(5378.64, 944.192, 1237.51),Rotation(126.532, -8.25145, -6.4033e-007)},
                easing = "easeOutQuad",
                fov = 40,
            },
            [100] = {
                path = {Vector3(3756.27, 1634.74, 595.36),Rotation(149.983, -7.20163, 2.13443e-007)},
                fov = 40
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 450,
            rot = Rotation(90,0,0),
            pos = Vector3(3685.81, 592.193, 640.589),
            start = 24
        }
    }

    self.arm_hcm.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(655.294, 1789.5, 2046.16),Rotation(48.7377, -3.63664, -0)},
                easing = "easeOutQuad",
                fov = 60,
                units = {
                    ["c4"] = {
                        id = "introcinematics/units/arm_hcm/c4_plantable/c4_plantable",
                        position = Vector3(440, 1986.14, 2006.75),
                        rotation = Rotation(90,90,70)
                    },
                    ["c4elecbox"] = {
                        id = "introcinematics/units/arm_hcm/bnk_prop_security_keybox/bnk_prop_security_keybox",
                        position = Vector3(440, 1986.14, 1996.75),
                        rotation = Rotation(90,0,0)
                    },
                    ["bridge1"] = {
                        id = "introcinematics/units/arm_hcm/overpass/hcm_b_ext_4x4m_a_overpass_end_a_interact",
                        position = Vector3(400, 2025, 1845),
                        rotation = Rotation(-90, 0, -0)
                    },
                    ["bridge2"] = {
                        id = "introcinematics/units/arm_hcm/overpass/hcm_b_ext_4x8m_a_overpass_tile_a_interact",
                        position = Vector3(400, 1625, 1845),
                        rotation = Rotation(-90, 0, -0)
                    },
                    ["bridge3"] = {
                        id = "introcinematics/units/arm_hcm/overpass/hcm_b_ext_4x8m_a_overpass_tile_a_interact",
                        position = Vector3(400, 825, 1845),
                        rotation = Rotation(-90, 0, -0)
                    },
                    ["bridge4"] = {
                        id = "introcinematics/units/arm_hcm/overpass/hcm_b_ext_4x4m_a_overpass_end_a_interact",
                        position = Vector3(825, -374.999, 1845),
                        rotation = Rotation(90, -0, -0)
                    }
                },
                lights = {
                    ["c4light"] = {
                        type = "omni|specular",
                        special = "beep",
                        color = Vector3(1,0,0),
                        position = Vector3(446, 1990.14, 2008.75),
                        far_range = 40,
                        special_params = {
                            speed = 0.07
                        }
                    },
                },
                hide_units = {
                    103632,
                    103085,
                    103086,
                    103643,
                    103687,
                    103591,
                    103592,
                    102129,
                    103633
                }
            },
            [100] = {
                path = {Vector3(669.421, 2126.52, 2018.9),Rotation(115.938, -1.18675, -5.33608e-008)},
                fov = 60,
                blackscreen = true
            }
        },
        update = [[
            if self.dialog_meta_data and self.dialog_meta_data.label then
                local dialog = self.dialog_meta_data.label
                local require_stage = 101
                if dialog == "pln_at1_intro_03_01" then
                    require_stage = 34
                elseif dialog == "pln_at1_intro_03_02" then
                    require_stage = 46
                else
                    require_stage = 37
                end

                if not stage.blackscreen and local_progress * 100 > require_stage then
                    stage.blackscreen = true
                end
            end
        ]],
        length = 14,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 250,
            rot = Rotation(0,0,0),
            pos = Vector3(477.351, 1881.4, 2055.35),
            start = 1
        }
    }

    self.arm_par.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-4315.21, 4693.08, 26.3886),Rotation(-43.5706, 0.483675, -1.33402e-008)},
                fov = 20,
                units = {
                    ["truck"] = {
                        id = "introcinematics/units/arm_par/str_vehicle_big_truck/str_vehicle_big_truck"
                    }
                }
            },
            [35] = {
                shakers = {
                    ["truck_drive"] = {
                        id = "player_freefall",
                        params = {0.01}
                    }
                }
            },
            [51] = {
                kill_shakers = {
                    "truck_drive"
                },
                shakers = {
                    ["truck_driveby"] = {
                        id = "whizby",
                        params = {0.8,0.2}
                    }
                }
            },
            [53] = {
                blackscreen = true
            },
            [100] = {
                path = {Vector3(-4408.39, 3968.44, 27.5964),Rotation(-71.9207, -0.216325, 6.67011e-009)},
                fov = 20,
                blackscreen = true
            }
        },
        update = [[
            local pos = Vector3(0,0,0)

            mvector3.lerp(pos,
                Vector3(-3389.87, 6079.99, -200),
                Vector3(-3389.87, 4079.99, -200),
                local_progress * 9 - 3.7)

            self.mem.units["truck"]:set_position(pos)
        ]],
        length = 10,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 430,
            rot = Rotation(180,0,0),
            pos = Vector3(-3095.96, 5548.44, 145.804),
            start = 5
        }
    }

    self.arm_fac.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-11769.4, -33685.6, 1767.79),Rotation(-35.3451, -4.05075, 1.06722e-007)},
                easing = "easeOutQuad",
                fov = 70,
            },
            [100] = {
                path = {Vector3(77.9013, -5358.6, 3150.87),Rotation(-20.9953, -40.4509, -0)},
                fov = 70
            }
        },
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(180,90,-90),
            pos = Vector3(-128.15, -4179.18, 2087.96),
            start = 74
        }
    }

    self.arm_for.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3633.05, -4593.9, 1664.95),Rotation(26.7311, -11.4026, -2.13443e-007)},
                easing = "easeOutQuad",
                fov = 80,
            },
            [100] = {
                path = {Vector3(-2413.12, -2654.01, 958.249),Rotation(-67.0686, -5.45302, -2.13443e-007)},
                fov = 80
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(-1705.878, -1653.8, 918.029),
            start = 44
        }
    }

    self.rat.cine_data = deep_clone(self.alex_1.cine_data)

    self.family.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3708.92, -3204.22, 1889.82),Rotation(-53.488, -42.2271, -4.26887e-007)},
                easing = "easeOutQuad",
                fov = 80,
                units = {
                    ["van"] = {
                        id = "introcinematics/units/global/str_vehicle_van_player/str_vehicle_van_player"
                    }
                },
                hide_units = {
                    500016
                }
            },
            [100] = {
                path = {Vector3(79.7152, 11.5739, 200.664),Rotation(-89.8885, -1.37715, -1.06722e-007)},
                fov = 80
            }
        },
        update = [[
            local pos = Vector3(0,0,0)

            mvector3.lerp(pos,
                Vector3(-1980, -1974, 0),
                Vector3(-1980, -1587, 0),
                Easing.easeOutQuad(local_progress * 3 + 0.3)
            )

            self.mem.units["van"]:set_position(pos)
        ]],
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 370,
            rot = Rotation(-180,0,0),
            pos = Vector3(370.848, 187.728, 264.214),
            start = 30
        }
    }

    self.big.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(3478.85, 1550.26, -24.7845),Rotation(134.456, -11.7519, 8.53774e-007)},
                fov = 80,
            },
            [100] = {
                path = {Vector3(3610.91, -627.568, -227.778),Rotation(67.6067, -9.65206, 4.26887e-007)},
                fov = 80
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(0,0,0),
            pos = Vector3(2483.14, -227.901, -275.513),
            start = 44
        }
    }

    self.roberts.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(2086.8, 2938.71, -20.8895),Rotation(166.064, 1.8006, -0)},
                fov = 60,
            },
            [100] = {
                path = {Vector3(1999.66, -1992.49, -1.10205),Rotation(70.8648, 3.55063, -2.13443e-007)},
                fov = 60
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(0,0,0),
            pos = Vector3(658.666, -1461.73, 369.321),
            start = 44
        }
    }

    self.mia_1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-2533.12, 3535.34, 2857.2),Rotation(-139.051, -18.0512, -4.26887e-007)},
                fov = 30,
            },
            [47] = {
                fade_out = 1
            },
            [_b(50)] = {
                path = {Vector3(439.034, 110.097, 1379.22),Rotation(-139.051, -18.0512, -4.26887e-007)},
                fov = 30,
                blackscreen = true
            },
            [50] = {
                fade_in = 1,
                path = {Vector3(4217.3, -1984.5, 752.648),Rotation(155.849, -8.25135, -1.06722e-007)},
                fov = 50
            },
            [100] = {
                path = {Vector3(818.399, -2069.29, 724.867),Rotation(-138.001, -11.7514, -8.53774e-007)},
                fov = 50
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(90,0,0),
            pos = Vector3(2512.73, -3097.09, 759.897),
            start = 60
        }
    }

    self.mia_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(691.813, -686.903, 72.0678),Rotation(52.0933, 67.7002, 3.41509e-006)},
                fov = 80,
            },
            [100] = {
                path = {Vector3(156.908, 303.078, 1846.06),Rotation(28.8443, -0.550075, 1.33402e-008)},
                fov = 80
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(-426.545, 1000.94, 1867.12),
            start = 44
        }
    }

    self.hox_1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-4179.12, -6695.69, -1653.71),Rotation(-75.9499, -8.6041, -4.26887e-007)},
                fov = 80,
                blackscreen = true
            },
            [30] = {
                path = {Vector3(-4179.12, -6695.69, -1653.71),Rotation(-75.9499, -8.6041, -4.26887e-007)},
                fov = 80,
                fade_in = 2,
                easing = "easeInOutQuad"
            },
            [100] = {
                path = {Vector3(-5836.83, -6898.25, 4.60223),Rotation(-28.0003, -7.20427, -0)},
                fov = 80
            }
        },
        length = 18,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(-90,0,0),
            pos = Vector3(-5267.05, -5117.19, -86.2077),
            start = 67
        }
    }

    self.hox_2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-97.8879, 4240.08, -324.093),Rotation(16.4302, -18.0515, -2.13443e-007)},
                fov = 80,
                fade_in = 2
            },
            [40] = {
                shakers = {
                    ["bang"] = {
                        id = "player_freefall",
                        params = {0.2,0.1}
                    }
                },
                effects = {
                    ["glass1"] = {
                        effect = "effects/payday2/particles/window/storefront_window_small",
                        position = Vector3(-293.029, 4939.86, -500.016),
                        normal = Vector3(0,0,1)
                    },
                    ["glass2"] = {
                        effect = "effects/payday2/particles/window/storefront_window_small",
                        position = Vector3(-189.029, 4982.86, -500.016),
                        normal = Vector3(0,0,1)
                    },
                    ["glass3"] = {
                        effect = "effects/payday2/particles/window/storefront_window_small",
                        position = Vector3(-42.029, 5022.86, -500.016),
                        normal = Vector3(0,0,1)
                    },
                    ["concrete"] = {
                        effect = "effects/payday2/particles/explosions/c4_wall_explosion",
                        position = Vector3(-370.029, 5117.86, -500.016),
                        normal = Vector3(0,0,1)
                    }
                }
            },
            [43] = {
                stop_shakers = {
                    "bang"
                }
            },
            [95] = {
                fade_out = 2
            },
            [100] = {
                path = {Vector3(355.203, 2559.25, 713.007),Rotation(23.7801, -39.0514, -2.56132e-006)},
                fov = 80
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(-383.972, 3763.87, 162.281),
            start = 44
        }
    }

    self.pines.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(2584.24, 17478.3, 6698.05),Rotation(155.683, -41.8502, -0)},
                fov = 80,
                shakers = {
                    ["wind"] = {
                        id = "headbob",
                        params = {0.6,0.04}
                    }
                },
                hide_units = {
                    101593,
                    101595,
                    101592,
                    101594
                }
            },
            [80] = {
                path = {Vector3(1314.66, 14583.8, 3877.25),Rotation(157.247, -27.0081, -0)},
                shakers = {
                    ["land"] = {
                        id = "player_land",
                        params = {2}
                    }
                },
                kill_shakers = {
                    "wind"
                },
                easing = "easeInOutQuad"
            },
            [84] = {
                fade_out = 2
            },
            [100] = {
                path = {Vector3(1314.66, 14583.8, 3877.25),Rotation(157.247, -17.0081, -0)},
                fov = 80,
                blackscreen = true
            }
        },
        length = 11,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(45,0,0),
            pos = Vector3(1240.88, 13837.4, 4020),
            start = 40
        }
    }

    self.mus.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-8947.21, -5136.23, -187.24),Rotation(-27.4566, -2.11861, -5.33608e-008)},
                fov = 80,
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(-5634.72, 1973.54, -0.974133),Rotation(-127.907, -7.36864, 2.13443e-007)},
                fov = 80
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(180,0,0),
            pos = Vector3(-4153.85, 707.707, -178.59),
            start = 44
        }
    }


    self.cage.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3632.15, 2020.38, 935.095),Rotation(-128.142, -17.7005, -0)},
                fov = 80,
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(-2458.71, -1201.39, 96.053),Rotation(-46.2424, 11.6999, 8.53774e-007)},
                fov = 80
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 550,
            rot = Rotation(180,0,0),
            pos = Vector3(-1698.99, -377.138, 352.472),
            start = 40
        }
    }

    self.hox_3.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-323.534, 19.7864, 251.745),Rotation(-90.3505, -2.64999, 4.26887e-007)},
                fov = 60
            },
            [100] = {
                path = {Vector3(-3520.97, 10.0854, 219.033),Rotation(-90.001, -1.95005, -0)},
                fov = 60
            }
        },
        length = 11,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 460,
            rot = Rotation(180,0,0),
            pos = Vector3(-374.87, 260, 360.403),
            start = 30
        }
    }

    self.crojob2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(4051.56, -2016.63, 1120.43),Rotation(37.5006, -15.2505, -4.26887e-007)},
                fov = 60
            },
            [100] = {
                path = {Vector3(-392.662, -4106.2, 1047.34),Rotation(19.3007, -6.50062, 1.06722e-007)},
                fov = 60
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 470,
            rot = Rotation(-90,0,0),
            pos = Vector3(-1564.94, -2016.72, 784.134),
            start = 65
        }
    }

    self.crojob3.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(7894.14, -13709.3, 1570.57),Rotation(18.109, -2.63146, 2.66804e-008)},
                fov = 60
            },
            [40] = {
                shakers = {
                    ["trainfall"] = {
                        id = "player_freefall",
                        params = {0.1,0.2}
                    }
                }
            },
            [75] = {
                stop_shakers = {
                    "trainfall"
                }
            },
            [95] = {
                fade_out = 1
            },
            [100] = {
                path = {Vector3(5511.95, -9852.09, 1539.47),Rotation(-2.19097, -1.93146, -6.67011e-009)},
                fov = 60,
                blackscreen = true
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(5292.85, -7686.23, 1587.53),
            start = 65
        }
    }

    self.shoutout_raid.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(554.55, 1571.97, 1050.51),Rotation(153.183, -5.35994, 2.13443e-007)},
                fov = 60
            },
            [100] = {
                path = {Vector3(2794.98, 824.089, 2255.78),Rotation(140.232, -16.2095, 4.26887e-007)},
                fov = 60
            }
        },
        length = 10,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(838.268, -940.322, 1894.65),
            start = 35
        }
    }

    self.arena.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1020.89, 527.859, 711.323),Rotation(-132.941, 15.5498, -0)},
                fov = 60
            },
            [100] = {
                path = {Vector3(89.8121, 782.842, 1182.54),Rotation(22.809, -25.0503, -0)},
                fov = 60
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(-656.692, 1901.89, 678.616),
            start = 55
        }
    }

    self.kenaz.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1968.91, -13288.3, -276.954),Rotation(-23.0006, 7.85021, 1.06722e-007)},
                fov = 60
            },
            [100] = {
                path = {Vector3(-749.208, -10596.5, -22.6837),Rotation(-21.9509, 31.6504, 8.53774e-007)},
                fov = 60
            }
        },
        length = 13,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(-90,0,0),
            pos = Vector3(-626.14, -9157.64, 938.616),
            start = 50
        }
    }

    self.jolly.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1394.74, 796.691, 416.35),Rotation(-1.84961, 71.2001, -5.33608e-008)},
                fov = 60
            },
            [100] = {
                path = {Vector3(848.03, -2196.69, 1006.99),Rotation(-42.0998, -7.20011, -0)},
                fov = 60
            }
        },
        length = 13,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(180,0,0),
            pos = Vector3(2254.46, -522.839, 903.696),
            start = 55
        }
    }

    self.red2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1958.27, 69.6485, 780.882),Rotation(-100.486, 11.3498, -1.70755e-006)},
                fov = 60,
                easing = "easeOutQuad",
                units = {
                    ["van"] = {
                        id = "introcinematics/units/global/str_vehicle_van_player/str_vehicle_van_player",
                        position = Vector3(-5307.72, 180, -30),
                        rotation = Rotation(180, 0, -0)
                    }
                }
            },
            [100] = {
                path = {Vector3(-6278.4, 254.679, 135.5859),Rotation(-107.136, 11.6997, 2.56132e-006)},
                fov = 60
            }
        },
        length = 18,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(180,0,0),
            pos = Vector3(-5083.68, 400, 400),
            start = 65
        }
    }

    self.dinner.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-4849.69, 5420.45, 1683.04),Rotation(-141.702, -9.65193, -8.53774e-007)},
                fov = 60
            },
            [45] = {
                fade_out = 3
            },
            [_b(50)] = {
                path = {Vector3(-4920.82, 5510.52, 1702.55),Rotation(-141.702, -9.65193, -8.53774e-007)},
                fov = 60,
                blackscreen = true
            },
            [50] = {
                path = {Vector3(-4560.03, 5875.96, 1785.81),Rotation(-32.1526, -16.6522, -4.26887e-007)},
                fov = 60,
                fade_in = 3
            },
            [100] = {
                path = {Vector3(-4487.63, 5529.42, 1723.13),Rotation(-36.0034, -9.30243, -4.26887e-007)},
                fov = 60
            }
        },
        length = 18,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(-90,0,0),
            pos = Vector3(-4478.75, 6320.72, 1700),
            start = 65
        }
    }

    self.pbr.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(6647.75, 1432.62, 379.535),Rotation(130.3, -49.2003, 1.70755e-006)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(3878.28, -36.5575, 445.533),Rotation(128.01, 12.5358, 4.26887e-007)},
                fov = 60
            }
        },
        length = 16,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(3193.78, -1185.1, 750),
            start = 45
        }
    }

    self.pbr2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-181.726, -2671.63, 46305.1),Rotation(-161.537, 17.6501, -4.26887e-007)},
                easing = "easeOutQuad",
                fov = 75,
                shakers = {
                    ["world"] = {
                        id = "player_freefall",
                        params = {0.04}
                    }
                }
            },
            [100] = {
                path = {Vector3(-829.089, -1937.36, 45966.3),Rotation(-151.913, 26.4001, 4.26887e-007)},
                fov = 75
            }
        },
        length = 10,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 550,
            rot = Rotation(90,0,0),
            pos = Vector3(150, -2958.29, 46500),
            start = 45
        }
    }

    self.peta.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(4210.4, 3837.4, 138.086),Rotation(137.205, 6.09775, -4.26887e-007)},
                easing = "easeOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(5892.61, 1859.88, 2060.73),Rotation(112.006, -13.1524, -1.28066e-006)},
                fov = 80
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(20,0,0),
            pos = Vector3(5420.21, 1410.285, 2091.86),
            start = 60
        }
    }

    self.pal.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1916.5, 1961.03, 707.64),Rotation(-99.1067, 45.3, -0)},
                easing = "easeOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(-5262.79, 2461.16, 208.13),Rotation(-111.009, 3.29978, -0)},
                fov = 80
            }
        },
        length = 18,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(150,0,0),
            pos = Vector3(-3974.08, 2200, 320),
            start = 50
        }
    }

    self.man.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(3564.86, -6142.53, 178.2039),Rotation(-18.2525, -1.25105, 0)},
                fov = 30,
                units = {
                    ["limo"] = {
                        id = "introcinematics/units/man/secret_stash_crane_vehicle_event/secret_stash_crane_event_crane",
                        position = Vector3(7681, -504.001, -381.75),
                        rotation = Rotation(-90, 0, -0)
                    }
                },
                hide_units = {
                    100161,
                    100155
                },
                shakers = {
                    ["world"] = {
                        id = "player_freefall",
                        params = {0.01}
                    }
                }
            },
            [27] = {
                fade_out = 1
            },
            [_b(30)] = {
                path = {Vector3(3199.34, -6021.98, 178.2039),Rotation(-18.2525, -1.25105, 0)},
                fov = 30,
                blackscreen = true,
                kill_shakers = {
                    "world"
                }
            },
            [30] = {
                path = {Vector3(-1267.27, -2066.68, 963.529),Rotation(-179.85, 1.25021, 0)},
                fov = 70,
                fade_in = 1,
                hide_units = {
                    100161,
                    100155
                },
                easing = "easeOutQuad"
            },
            [100] = {
                path = {Vector3(-1235.13, -169.934, 955.005),Rotation(-178.45, 4.75029, 0)},
                fov = 70
            }
        },
        update = [[
            local pos = Vector3(0,0,0)

            mvector3.lerp(pos,
                Vector3(7681, -504.001, -381.75),
                Vector3(4829, -504.001, -381.75),
                local_progress * 10 - 0.6
            )

            self.mem.units["limo"]:set_position(pos)
        ]],
        length = 40,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 300,
            rot = Rotation(90,0,0),
            pos = Vector3(-1150, -600, 1000),
            start = 75
        }
    }

    self.mad.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(17895.8, -5922.64, -283.879),Rotation(64.1281, 5.04886, -2.13443e-007)},
                easing = "easeOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(8227.88, 66.4241, 1663.29),Rotation(64.129, -14.5514, -4.26887e-007)},
                fov = 80
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 700,
            rot = Rotation(0,0,0),
            pos = Vector3(7159.87, 400.045, 1725.11),
            start = 50
        }
    }

    self.dark.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3114.25, 1503.38, 668.521),Rotation(-66.2463, -24.001, 8.53774e-007)},
                easing = "easeOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(-3038.12, 1819.7, 924.857),Rotation(-68.6967, -27.5013, -0)},
                fov = 80
            }
        },
        length = 17,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(180,0,0),
            pos = Vector3(-1811.36, 2463.64, 504.218),
            start = 60
        }
    }

    self.born.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(580.444, -1502.55, 558.254),Rotation(166.563, 7.66258, 2.66804e-007)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(524.879, -679.87, 566.852),Rotation(-125.536, -9.4872, -8.53774e-007)},
                fov = 60
            }
        },
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 200,
            rot = Rotation(90,0,0),
            pos = Vector3(706.733, -759.144, 553.644),
            start = 70
        }
    }

    self.chill_combat.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(619.822, -268.739, 66.0153),Rotation(15.268, 0.954939, 1.33402e-008)},
                easing = "easeOutQuad",
                fov = 70
            },
            [100] = {
                path = {Vector3(675.443, -229.005, 740.53),Rotation(17.3685, -24.9454, -4.26887e-007)},
                fov = 70
            }
        },
        length = 11,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 300,
            rot = Rotation(270,0,0),
            pos = Vector3(470.065, 204.301, 618.618),
            start = 50
        }
    }

    self.friend.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(4451.47, -3253.57, 223.367),Rotation(48.8509, 6.45461, -0)},
                easing = "easeOutQuad",
                fov = 70
            },
            [100] = {
                path = {Vector3(4817.71, -2444.54, 623.146),Rotation(71.6015, -1.94564, 1.06722e-007)},
                fov = 70
            }
        },
        length = 16,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(0, 0, 0),
            pos = Vector3(1942.67, -1814.66, 1000),
            start = 70
        }
    }

    self.flat.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1390.58, 973.644, 809.373),Rotation(-179.501, -7.20043, -6.67011e-009)},
                easing = "easeOutQuad",
                fov = 70
            },
            [100] = {
                path = {Vector3(-1394.78, 1456.4, 870.365),Rotation(-179.501, -7.20043, -6.67011e-009)},
                fov = 70
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 270,
            rot = Rotation(90, 0, 0),
            pos = Vector3(-1302.88, 1131.09, 872.006),
            start = 50
        }
    }

    self.help.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-2722, -4568.54, 166.079),Rotation(51.0512, 16.2497, 54.26887e-007)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(-3675.06, -3136.17, 157.614),Rotation(3.10109, 12.24974, 16.67011e-009)},
                fov = 60
            }
        },
        length = 14,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 350,
            rot = Rotation(270, 0, 0),
            pos = Vector3(-3864.17, -2439.26, 271.629),
            start = 50
        }
    }

    self.haunted.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1417.37, 2989.58, -210.419),Rotation(-6.49905, -0.200294, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(-1445.85, 3539.05, -212.316),Rotation(-6.49905, -0.200294, -0)},
                fov = 60
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 200,
            rot = Rotation(270, 0, 0),
            pos = Vector3(-1472.49, 3662.45, -192.387),
            start = 40
        }
    }

    self.spa.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(8222.7, -225.159, 969.633),Rotation(64.2025, 59.9997, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(8331.81, -378.097, 285.33),Rotation(79.2545, 22.1998, -3.41509e-006)},
                fov = 60
            }
        },
        length = 18,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(0, 0, 0),
            pos = Vector3(7661.53, -347.018, 601.133),
            start = 60
        }
    }

    self.fish.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-43.4067, -9529.26, -270.722),Rotation(10.9498, -80, 4.26887e-007)},
                easing = "easeOutQuad",
                fov = 70,
                hide_units = {
                    400018
                },
                units = {
                    ["boat"] = {
                        id = "introcinematics/units/fish/anim_vehicle_rubber_boat/anim_vehicle_rubber_boat",
                        position = Vector3(-11, -8509, -915.705),
                        rotation = Rotation(-0, -0, -0)
                    }
                }
            },
            [100] = {
                path = {Vector3(414.457, -5497.44, -240.93),Rotation(7.44998, 24.65, -0)},
                fov = 70
            }
        },
        update = [[
            local pos = Vector3(0,0,0)

            mvector3.lerp(pos,
                Vector3(-11, -8509, -915.705),
                Vector3(-11, -5484, -915.705),
                local_progress * 3)

            self.mem.units["boat"]:set_position(pos)
        ]],
        length = 12,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(270, 0, 0),
            pos = Vector3(-532.077, -3719.64, 449.626),
            start = 60
        }
    }

    self.moon.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(497.348, -3578.87, 2048.61),Rotation(9.04897, -40.1021, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(155.122, -1430.03, 216.177),Rotation(11.849, -5.10219, 1.06722e-007)},
                fov = 60
            }
        },
        length = 23,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            align = "billboard_x",
            pos = Vector3(232.645, -1204.963, 223.795),
            start = 70
        }
    }

    self.glace.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1283.84, -14861.1, 6475.28),Rotation(0.299282, -80, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(-1341.06, -8084.92, 6490.72),Rotation(0.649266, -0.550278, -4.16882e-010)},
                fov = 60
            }
        },
        update = [[
            if self.dialog_meta_data and self.dialog_meta_data.label then
                local dialog = self.dialog_meta_data.label
                local require_stage = 101
                if dialog == "pln_glc_intro_02" then
                    require_stage = 16
                elseif dialog == "pln_glc_intro_03" then
                    require_stage = 30
                else
                    require_stage = 40
                end

                if not self.mem.custom.shake_id and local_progress * 100 > require_stage and local_progress * 100 < require_stage + 6 then
                    self.mem.custom.shake_id = self.cine_cam_unit:camera():shaker():play("player_freefall", 0.2, 0.1)
                end

                if self.mem.custom.shake_id and local_progress * 100 > require_stage + 6 then
                    self.cine_cam_unit:camera():shaker():stop(self.mem.custom.shake_id)
                    self.mem.custom.shake_id = nil
                end
            end
        ]],
        length = 18,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(270, 0, 0),
            pos = Vector3(-1703.73, -7185.82, 6520.42),
            start = 60
        }
    }

    self.dah.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3216.01, 1859.57, 545.008),Rotation(-141.639, 46.3492, 3.41509e-006)},
                easing = "easeOutQuad",
                fov = 40
            },
            [100] = {
                path = {Vector3(-4207.44, 2224.49, 479.64),Rotation(-156.69, 8.89953, 2.13443e-007)},
                fov = 40
            }
        },
        length = 21,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(-3697.78, -105.585, 825.858),
            start = 60
        }
    }

    self.rvd1.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3446.56, -3554.15, 75.5712),Rotation(-112.803, 19.7507, -1.70755e-006)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(1621.14, 776.269, 837.125),Rotation(150.344, -4.9956, -1.06722e-007)},
                fov = 60
            }
        },
        length = 24,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(541.455, -792.841, 747.717),
            start = 60
        }
    }

    self.rvd2.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-3487.48, -530.062, 280.131),Rotation(-61.9731, -80, 1.70755e-006)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(419.479, 1391.2, 518.724),Rotation(-67.8024, -7.80019, -0)},
                fov = 60
            }
        },
        length = 11,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(1352, 1332.08, 580.158),
            start = 50
        }
    }

    self.hvh.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(2861.62, -4394.94, 79.2257),Rotation(-60.9527, 15.1992, -4.26887e-007)},
                easing = "easeOutQuad",
                fov = 60,
                shakers = {
                    ["sway"] = {
                        id = "headbob",
                        params = {0.6,0.04}
                    }
                }
            },
            [100] = {
                path = {Vector3(3060.52, -4616.16, 419.25),Rotation(-134.103, 10.6495, -4.26887e-007)},
                fov = 60
            }
        },
        length = 11,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(3849.66, -6081.11, 808.813),
            start = 50
        }
    }

    self.wwh.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(6484.56, 10687.7, 815.96),Rotation(61.8671, -3.40637, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(4046.54, 5108.57, 2089.43),Rotation(165.117, -11.1064, -4.26887e-007)},
                fov = 60
            }
        },
        length = 24,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(3584.89, 3421.7, 1901.29),
            start = 50
        }
    }

    self.kosugi.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(5954.52, 2755.2, 1713.5),Rotation(131.563, -80, -1.70755e-006)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(2433.26, -689.331, 1658.14),Rotation(101.813, 6.09994, 4.26887e-007)},
                fov = 60
            }
        },
        length = 14,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(0, 0, 0),
            pos = Vector3(804.348, -1625.48, 1780.53),
            start = 50
        }
    }

    self.brb.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1528.21, -6979.42, 906.979), Rotation(-18.4418, -10.3502, -0)},
                easing = "easeOutQuad",
                fov = 60
            },
            [72] = {
                shakers = {
                    ["bang"] = {
                        id = "player_freefall",
                        params = {0.2,0.1}
                    }
                }
            },
            [74] = {
                stop_shakers = {
                    "bang"
                }
            },
            [100] = {
                path = {Vector3(650.773, -655.157, 509.364), Rotation(-87.7425, -3.00036, -1.06722e-007)},
                fov = 60
            }
        },
        length = 28,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(180, 0, 0),
            pos = Vector3(1516.5, -173.618, 600.541),
            start = 70
        }
    }

    self.tag.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(563.166, 1097.14, 937.301),Rotation(96.9026, -1.5499, 5.33608e-008)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(443.952, -220.45, 937.684),Rotation(140.653, -22.55, -0)},
                fov = 60
            }
        },
        length = 32,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            rot = Rotation(90, 0, 0),
            pos = Vector3(205.0535, -812.008, 746.181),
            start = 50
        }
    }

    self.des.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-60.5008, -87.7666, 238.948),Rotation(0.2263, -2.30086, -0)},
                easing = "easeOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(-1207.54, -2552.17, 844.983),Rotation(-162.023, -10.7008, 2.13443e-007)},
                fov = 80
            }
        },
        length = 22,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 800,
            rot = Rotation(90, 0, 0),
            pos = Vector3(-115.492, -4973.95, 476.073),
            start = 50
        }
    }

    self.nmh.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(2263.63, 3360.61, -648.839),Rotation(165.203, -3.7004, -5.33608e-008)},
                fov = 50
            },
            [47] = {
                fade_out = 1
            },
            [_b(50)] = {
                path = {Vector3(2263.63, 3360.61, -200),Rotation(165.203, -3.7004, -5.33608e-008)},
                fov = 50,
                blackscreen = true
            },
            [50] = {
                fade_in = 1,
                path = {Vector3(941.15, 906.702, 22.3463),Rotation(139.105, -8.60039, 4.26887e-007)},
                easing = "easeOutQuad",
                fov = 50
            },
            [100] = {
                path = {Vector3(941.15, 906.702, 239.3463),Rotation(139.105, -8.60039, 4.26887e-007)},
                fov = 50
            }
        },
        length = 25,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 250,
            align = "billboard_x",
            pos = Vector3(647.601, 390.54, 238.374),
            start = 70
        }
    }

    self.sah.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-656.244, -4362.46, -70.0167),Rotation(-22.6598, -0.28818, -1.00052e-008)},
                easing = "easeOutQuad",
                fov = 80
            },
            [100] = {
                path = {Vector3(847.444, -4383.68, 22.2198),Rotation(18.992, 21.7608, 2.13443e-007)},
                fov = 80
            }
        },
        length = 20,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 350,
            rot = Rotation(270, 0, 0),
            pos = Vector3(500, -4114.74, 179.598),
            start = 60
        }
    }

    self.bph.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1942.88, -10418.5, 717.074),Rotation(147.651, 64.9001, -2.56132e-006)},
                fov = 70
            },
            [47] = {
                fade_out = 0.5
            },
            [_b(50)] = {
                path = {Vector3(1942.88, -10418.5, -103),Rotation(161.302, 12.3997, -2.13443e-007)},
                fov = 70,
                blackscreen = true
            },
            [50] = {
                path = {Vector3(-1095.39, -3762.04, 2328.35),Rotation(140.652, 6.09966, 2.13443e-007)},
                easing = "easeOutQuad",
                fov = 70,
                fade_in = 0.5
            },
            [100] = {
                path = {Vector3(-1431.95, -3544.27, 882.282),Rotation(161.302, 5.40004, 3.20165e-007)},
                fov = 70
            }
        },
        length = 28,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(134.702 - 90, 0, 0),
            pos = Vector3(-1758.94, -4707.48, 1013.97),
            start = 75
        }
    }

    self.mex.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1444.03, 4000.8, 263.1298),Rotation(-112.401, -5.10015, -2.13443e-007)},
                easing = "easeOutQuad",
                fov = 90
            },
            [100] = {
                path = {Vector3(-1460.4, 833.933, 263.908),Rotation(-79.502, 15.1998, 1.70755e-006)},
                fov = 90
            }
        },
        length = 14,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 460,
            rot = Rotation(180, 0, 0),
            pos = Vector3(-332.452, 1322.05, 381.732),
            start = 55
        }
    }

    self.mex_cooking.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(2690.39, -11676.6, -2488.4),Rotation(179.743, 0.612385, 2.08441e-010)},
                easing = "easeOutQuad",
                fov = 70
            },
            [100] = {
                path = {Vector3(3848.43, -7948.27, -2734.26),Rotation(152.094, -2.53792, 5.33608e-008)},
                fov = 70
            }
        },
        length = 15,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 460,
            align = "billboard_x",
            pos = Vector3(3439.68, -9180.94, -2619.28),
            start = 55
        }
    }

    self.bex.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(3763.41, -3367.86, 1795.34),Rotation(29.9512, -12.4507, 4.26887e-007)},
                easing = "easeOutQuad",
                fov = 70
            },
            [100] = {
                path = {Vector3(1476.99, 3774.61, 1558.32),Rotation(144.404, -7.5513, -0)},
                fov = 70
            }
        },
        length = 44,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 600,
            align = "billboard_x",
            pos = Vector3(440.398, 1826.65, 1472.75),
            start = 65
        }
    }

    self.pex.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(207.572, -3914.97, 34.8043),Rotation(3.77659, -3.73587, 2.66804e-008)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(-245.4, -808.997, 715.502),Rotation(-42.9568, -4.40179, 1.06722e-007)},
                fov = 60
            }
        },
        length = 12,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(270, 0, 0),
            pos = Vector3(155.872, -98.2044, 687.424),
            start = 45
        }
    }

    self.fex.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-5448.1, 31205.2, 471.136),Rotation(-142.303, -0.90024, -8.00413e-008)},
                easing = "easeOutQuad",
                fov = 60
            },
            [100] = {
                path = {Vector3(661.617, 5601.53, 820.796),Rotation(163.798, -6.50014, -2.13443e-007)},
                fov = 60
            }
        },
        length = 30,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(90, 0, 0),
            pos = Vector3(309.519, 3746.95, 788.658),
            start = 75
        }
    }

    self.chas.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(1341.67, -1621.21, 841.44),Rotation(155.042, 24.6498, 1.28066e-006)},
                fov = 60
            },
            [100] = {
                path = {Vector3(1510.9, 309.069, 230.599),Rotation(89.2427, -0.200516, -2.66804e-008)},
                fov = 60
            }
        },
        length = 41,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            rot = Rotation(0,0,0),
            pos = Vector3(581.013, 50, 306.82),
            start = 80
        }
    }

    self.sand.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-1213.18, -630.481, 793.668),Rotation(40.538, 0.746551, -0)},
                fov = 70
            },
            [100] = {
                path = {Vector3(2329.09, -2844.68, 661.069),Rotation(57.3375, -1.35344, -5.33608e-008)},
                fov = 70
            }
        },
        length = 33,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(-30.2497, -2218.2, 739.7),
            start = 70
        }
    }

    self.chca.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-9162.52, 7873.02, 214.35),Rotation(13.7942, 10.6484, -3.20165e-007)},
                fov = 80
            },
            [46] = {
                fade_out = 2
            },
            [49] = {
                path = {Vector3(-8909.1, 6602.95, 110.233),Rotation(43.5463, 11.6979, -4.26887e-007)},
                fov = 80,
                blackscreen = true
            },
            [50] = {
                fade_in = 1,
                path = {Vector3(-9970.15, 2888.39, 279.249),Rotation(-125.154, 7.14776, 4.26887e-007)},
                fov = 80
            },
            [99] = {
                fade_out = 1
            },
            [100] = {
                path = {Vector3(-10133.1, 1306.19, 279.249),Rotation(-64.9547, 1.54777, -1.06722e-007)},
                fov = 80
            }
        },
        length = 29,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 500,
            align = "billboard_x",
            pos = Vector3(-8995.18, 1601.51, 472.514),
            start = 80
        }
    }

    self.pent.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-527.325, 4689.61, -19.8118),Rotation(-158.462, -18.0008, 2.13443e-007)},
                fov = 70
            },
            [45] = {
                fade_out = 1
            },
            [_b(50)] = {
                path = {Vector3(-329.232, 4148.39, 132.54),Rotation(-164.064, 48.7996, -1.28066e-006)},
                fov = 70,
                blackscreen = true
            },
            [50] = {
                path = {Vector3(-430.645, -661.353, 12036),Rotation(-149.709, 14.8997, 4.26887e-007)},
                fov = 70,
                fade_in = 1
            },
            [100] = {
                path = {Vector3(-288.141, -930.361, 12414.4),Rotation(-149.01, -12.7502, 6.4033e-007)},
                fov = 70
            }
        },
        length = 14,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 400,
            rot = Rotation(-226.752, 0, -0),
            pos = Vector3(382.835, -2140.71, 12382.4),
            start = 50
        }
    }

    self.ranc.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(6518.03, -4876.01, 2774.22),Rotation(0.997665, -2.30068, -0)},
                fov = 70
            },
            [100] = {
                path = {Vector3(7379.2, -3477.98, 2908.28),Rotation(40.1981, -39.4011, -0)},
                fov = 70
            }
        },
        length = 24,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 800,
            rot = Rotation(0, 0, -90),
            pos = Vector3(5436.17, -2044.21, 549.378),
            start = 70
        }
    }

    self.trai.cine_data = {
        timeline = {
            [0] = {
                path = {Vector3(-7483.37, 8254.21, -17.0035),Rotation(-119.1, -1.93158, -5.33608e-008)},
                fov = 50,
                smooth_fov = true
            },
            [100] = {
                path = {Vector3(-6745.49, 7607.73, 1045.78),Rotation(-116.503, -10.3502, -1.70755e-006)},
                fov = 80
            }
        },
        length = 24,
        __original = true,
        hideblackbars = false,
        hologram = {
            size = 800,
            rot = Rotation(180, 0, 0),
            pos = Vector3(-4366.41, 6948.08, 955.294),
            start = 50
        }
    }
end)
