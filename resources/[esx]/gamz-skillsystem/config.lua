Config = {}

Config.UpdateFrequency = 3600 -- seconds interval between removing values 

Config.Notifications = true -- notification when skill is added

Config.Skills = {
	--https://escapefromtarkov.gamepedia.com/Endurance
    ["Uthållighet"] = {
        ["Current"] = 0, -- Default value 
        ["RemoveAmount"] = -1.0, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA" -- GTA stat hashname
    },

    --https://escapefromtarkov.gamepedia.com/Health
    ["Hälsa"] = {
        ["Current"] = 0, -- Default value 
        ["RemoveAmount"] = -1.0, -- % to remove when updating,
        ["Stat"] = "-1" -- GTA stat hashname
    },

    ["Styrka"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.3,
        ["Stat"] = "MP0_STRENGTH"
    },

    --https://escapefromtarkov.gamepedia.com/Vitality
    ["Vitalitet"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.2,
        ["Stat"] = "-1"
    },

    --https://escapefromtarkov.gamepedia.com/Attention
    ["Uppmärksamhet"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.2,
        ["Stat"] = "-1"
    },

    ["Lungkapacitet"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.2,
        ["Stat"] = "MP0_LUNG_CAPACITY"
    },

    ["Vapenhantering"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_SHOOTING_ABILITY"
    },

    ["Körning"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.5,
        ["Stat"] = "MP0_DRIVING_ABILITY"
    },

    ["Tillvärkning"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.5,
        ["Stat"] = "-1"
    },

    ["Låsdyrkning"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.5,
        ["Stat"] = "-1"
    }
--[[
    ["Wheelie"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.2,
        ["Stat"] = "MP0_WHEELIE_ABILITY"
    }
]]
}
