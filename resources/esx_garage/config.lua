Config = {}

Config.VehicleMenu = true -- enable this if you wan't a vehicle menu.
Config.VehicleMenuButton = 344 -- change this to the key you want to open the menu with. buttons: https://docs.fivem.net/game-references/controls/
Config.RangeCheck = 25.0 -- this is the change you will be able to control the vehicle.

Config.Garages = {
    ["A"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(100.98, -1071.78, 29.23)
            },
            ["vehicle"] = {
                ["position"] = vector3(106.37, -1063.42, 29.1), 
                ["heading"] = 64.28
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 116.51, 
            ["y"] = -1065.79,
            ["z"] = 32.19, 
            ["rotationX"] = -11.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -263.40157422423 
        }
    },

    ["B"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(273.67422485352, -344.15573120117, 44.919834136963)
            },
            ["vehicle"] = {
                ["position"] = vector3(272.50082397461, -337.40579223633, 44.919834136963), 
                ["heading"] = 160.0
            }
        },
        ["camera"] = { 
            ["x"] = 283.28225708008, 
            ["y"] = -333.24017333984, 
            ["z"] = 50.004745483398, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 125.73228356242 
        }
    },

    ["C"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1803.8967285156, -341.45928955078, 43.986347198486)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1810.7857666016, -337.13592529297, 43.552074432373), 
                ["heading"] = 320.0
            }
        },
        ["camera"] = { 
            ["x"] = -1813.5513916016, 
            ["y"] = -340.40087890625, 
            ["z"] = 46.962894439697, 
            ["rotationX"] = -39.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -42.110235854983 
        }
    },

    ["D"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(407.06, -1625.5, 29.29)
            },
            ["vehicle"] = {
                ["position"] = vector3(401.35, -1631.82, 28.47), 
                ["heading"] = 230.54
            }
        },
        ["camera"] = {
            ["x"] = 404.22,
            ["y"] = -1638.38,
            ["z"] = 31.29,
            ["rotationX"] = -19.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 22.110235854983 
        }
    },
}

Config.Labels = {
    ["menu"] = "~INPUT_CONTEXT~ Öppna garage %s.",
    ["vehicle"] = "~INPUT_CONTEXT~ Parkera ~p~%s~w~ i ditt garage."
}

Config.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

Config.AlignMenu = "right" -- this is where the menu is located [left, right, center, top-right, top-left etc.]