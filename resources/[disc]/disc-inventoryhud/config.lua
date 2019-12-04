Config = {}

Config.Locale = 'en'
Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000

Config.Shops = {
--[[Ta bort denna efter test]]    ['Test Butik'] = {
        coords = {
            vector3(256.16, -865.09, 28.41),
        },
        items = {
            { name = "WEAPON_APPISTOL", price = 1, count = 1 },
            { name = "WEAPON_ASSAULTRIFLE", price = 1, count = 1 },
            { name = "WEAPON_ASSAULTSHOTGUN", price = 1, count = 1 },
            { name = "WEAPON_ASSAULTSMG", price = 1, count = 1 },
            { name = "WEAPON_AUTOSHOTGUN", price = 1, count = 1 },
            { name = "WEAPON_BAT", price = 1, count = 1 },
            { name = "disc_ammo_pistol", price = 1, count = 1 },
            { name = "disc_ammo_pistol_large", price = 1, count = 1 },
            { name = "disc_ammo_rifle", price = 1, count = 1 },
            { name = "disc_ammo_rifle_large", price = 1, count = 1 },
            { name = "disc_ammo_shotgun", price = 1, count = 1 },
            { name = "disc_ammo_shotgun_large", price = 1, count = 1 },
            { name = "disc_ammo_smg", price = 1, count = 1 },
            { name = "disc_ammo_smg_large", price = 1, count = 1 },
            { name = "disc_ammo_snp", price = 1, count = 1 },
            { name = "disc_ammo_snp_large", price = 1, count = 1 },
            { name = "adrenaline", price = 1, count = 1 },
            { name = "bandage", price = 1, count = 1 },
            { name = "beer", price = 1, count = 1 },
            { name = "bread", price = 1, count = 1 },
            { name = "coke", price = 1, count = 1 },
            { name = "firstaid", price = 1, count = 1 },
            { name = "gauze", price = 1, count = 1 },
            { name = "hydrocodone", price = 1, count = 1 },
            { name = "medkit", price = 1, count = 1 },
            { name = "meth", price = 1, count = 1 },
            { name = "morphine", price = 1, count = 1 },
            { name = "opium", price = 1, count = 1 },
            { name = "patch", price = 1, count = 1 },
            { name = "phone", price = 1, count = 1 },
            { name = "vicodin", price = 1, count = 1 },
            { name = "water", price = 1, count = 1 },
            { name = "weed", price = 1, count = 1 },
        },
        blipSprite = 79,
        blipColour = 83,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Test Butiken~s~',
        job = 'all'
    },
    ['Barracuda Fiskeshop'] = {
        coords = {
            vector3(-3275.48, 969.75, 7.45),
        },
        items = {
            { name = "fishingrod", price = 100, count = 1 },
            { name = "fishbait", price = 5, count = 10 },
        },
        blipSprite = 68,
        blipColour = 1,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Barracuda Fiskeshop~s~',
        job = 'all'
    },
    ['Amirs Livs'] = {
        coords = {
            vector3(-1172.07, -1571.93, 3.70),
        },
        items = {
            { name = "rizla", price = 15, count = 1 }
        },
        blipSprite = 52,
        blipColour = 51,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Amirs Livs~s~',
        job = 'all'
    },
    ['Sjukhus Kiosken'] = {
        coords = {
            vector3(316.88, -588.64, 42.32),
        },
        items = {
            { name = "bread", price = 25, count = 1 },
            { name = "varmkorv", price = 25, count = 1 },
            { name = "water", price = 20, count = 1 },
            { name = "cola", price = 20, count = 1 },
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Sjukhus Kiosken~s~',
        job = 'all'
    },
    ['Dealer'] = {
        coords = {
            vector3(-1207.59, -240.18, 36.97),
        },
        items = {
            {name = 'chemicals', price = 100, count = 1},
            {name = 'fuel', price = 200, count = 1},
            {name = 'grinder', price = 150, count = 1},
            {name = 'plasticbag', price = 15, count = 1},
            {name = 'scale', price = 200, count = 1},
            {name = 'seed', price = 450, count = 1}
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på den ~r~svarta marknaden~s~',
        job = 'all'
    }
}

Config.Stash = {
    ['Polis Förråd'] = {
        coords = vector3(461.17, -982.5, 30.69),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~p~Förråd~s~'
    },
    ['Sjukvård Förråd'] = {
        coords = vector3(342.25, -586.19, 42.35),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ambulance',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~p~Förråd~s~'
    },
    ['Mekonomen Förråd'] = {
        coords = vector3(-344.38, -128.11, 38.05),
        size = vector3(1.0, 1.0, 1.0),
        job = 'mechanic',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~p~Förråd~s~'
    },
    ['Bennys Förråd'] = {
        coords = vector3(-224.21, -1320.18, 29.95),
        size = vector3(1.0, 1.0, 1.0),
        job = 'bennys',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~p~Förråd~s~'
    },
    ['NE Bilcenter'] = {
        coords = vector3(-30.82, -1110.94, 25.50),
        size = vector3(1.0, 1.0, 1.0),
        job = 'cardealer',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~p~Förråd~s~'
    }
}

Config.Steal = {
    black_money = false,
    cash = true
}

Config.Seize = {
    black_money = false,
    cash = true
}

Config.VehicleLimit = {
    ['Zentorno'] = 10,
    ['Panto'] = 1,
    ['Zion'] = 5
}

--Courtesy DoctorTwitch
Config.VehicleSlot = {
    [0] = 10, --Compact
    [1] = 15, --Sedan
    [2] = 20, --SUV
    [3] = 15, --Coupes
    [4] = 5, --Muscle
    [5] = 5, --Sports Classics
    [6] = 5, --Sports
    [7] = 0, --Super
    [8] = 5, --Motorcycles
    [9] = 10, --Off-road
    [10] = 20, --Industrial
    [11] = 20, --Utility
    [12] = 30, --Vans
    [13] = 0, --Cycles
    [14] = 0, --Boats
    [15] = 0, --Helicopters
    [16] = 0, --Planes
    [17] = 20, --Service
    [18] = 20, --Emergency
    [19] = 90, --Military
    [20] = 0, --Commercial
    [21] = 0 --Trains
}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847