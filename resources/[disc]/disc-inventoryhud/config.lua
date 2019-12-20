Config = {}

Config.Locale = 'sv'
Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000
Config.CheckLicense = true

Config.Shops = {
    ['Barracuda Fiskeshop'] = {
        coords = {
            vector3(-3275.48, 969.75, 8.40),
        },
        items = {
            { name = "fishingrod", price = 250, count = 1 },
            { name = "bait", price = 5, count = 1 },
        },
        blipSprite = 68,
        blipColour = 1,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        enableBlip = true,
        rotate = false,
        bob = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Barracuda Fiskeshop~s~',
        job = 'all'
    },
    ['Amirs Livs'] = {
        coords = {
            vector3(-1172.36, -1572.19, 4.66),
        },
        items = {
            { name = "rizla", price = 15, count = 1 },
            { name = "cigaretter", price = 50, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "snusdosa", price = 40, count = 1 },
        },
        blipSprite = 52,
        blipColour = 51,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Amirs Livs~s~',
        job = 'all'

    },
    ['Sjukhus Kiosken'] = {
        coords = {
            vector3(335.19, -585.38, 28.8),
        },
        items = {
            { name = "bread", price = 25, count = 1 },
            { name = "korv", price = 35, count = 1 },
            { name = "donut", price = 20, count = 1 },
            { name = "choklad", price = 12, count = 1 },
            { name = "cola", price = 20, count = 1 },
            { name = "water", price = 25, count = 1 },
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Sjukhus Kiosken~s~',
        job = 'ambulance'
    },
    ['Dealer'] = {
        coords = {
            vector3(-2.82, -1821.54, 29.60),
        },
        items = {
            {name = 'chemicals', price = 100, count = 1},
            {name = 'fuel', price = 200, count = 1},
            {name = 'grinder', price = 150, count = 1},
            {name = 'plasticbag', price = 15, count = 1},
            {name = 'scale', price = 200, count = 1},
            {name = 'seed', price = 450, count = 1},
            {name = 'causticsoda', price = 100, count = 1},
            {name = 'cement', price = 125, count = 1},
            {name = 'radio', price = 700, count = 1},
            {name = 'adrenaline', price = 1300, count = 1},
            {name = 'WEAPON_SWITCHBLADE', price = 1600, count = 1},
            {name = 'WEAPON_KNIFE', price = 1200, count = 1},
            {name = 'WEAPON_BAT', price = 500, count = 1},
            {name = 'WEAPON_CROWBAR', price = 300, count = 1},
            {name = 'WEAPON_KNUCKLE', price = 900, count = 1},
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på den ~r~svarta marknaden~s~',
        job = 'all'
    },
    ['7-Eleven'] = {
        coords = {
            vector3(373.875, 325.896, 103.666),
            vector3(2557.458, 382.282, 108.722),
            vector3(-3038.939, 585.954, 8.008),
            vector3(-3241.927, 1001.462, 12.950),
            vector3(547.431, 2671.710, 42.256),
            vector3(1961.464, 3740.672, 32.443),
            vector3(2678.916, 3280.671, 55.341),
            vector3(1729.14, 6414.29, 35.137),
            vector3(25.84, -1347.5, 29.5),
        },
        items = {
            { name = "phone", price = 250, count = 1 },
            { name = "bread", price = 25, count = 1 },
            { name = "chips", price = 20, count = 1 },
            { name = "choklad", price = 12, count = 1 },
            { name = "water", price = 25, count = 1 },
            { name = "cola", price = 20, count = 1 },
        },
        blipSprite = 52,
        blipColour = 15,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        msg = '~INPUT_CONTEXT~ för att handla på ~g~TwentyFourSeven~s~',
        enableBlip = true,
        job = 'all'
    },
    ['Systembolaget'] = {
        coords = {
            vector3(1135.808, -982.281, 46.420),
            vector3(-1223.10, -906.75, 12.345),
            vector3(-1487.553, -379.107, 40.225),
            vector3(-2968.243, 390.910, 15.073),
            vector3(1166.024, 2708.930, 38.170),
            vector3(1392.562, 3604.684, 35.0),
            vector3(-1393.409, -606.624, 30.330),
            vector3(-559.906, 287.093, 82.180),
        },
        items = {
            { name = "beer", price = 25, count = 1 },
            { name = "jager", price = 40, count = 1 },
        },
        blipSprite = 93,
        blipColour = 69,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Systembolaget~s~',
        enableBlip = true,
        job = 'all'
    },
    ['Macken'] = {
        coords = {
            vector3(-48.519, -1757.514, 29.521),
            vector3(1163.373, -323.801, 69.305),
            vector3(-707.501, -914.260, 19.315),
            vector3(-1820.523, 792.518, 138.218),
            vector3(1698.388, 4924.404, 42.163),
        },
        items = {
            { name = "hamburgare", price = 42, count = 1 },
            { name = "Korv", price = 35, count = 1 },
            { name = "donut", price = 20, count = 1 },
            { name = "cola", price = 20, count = 1 },
            { name = "cigaretter", price = 50, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "snusdosa", price = 40, count = 1 },
        },
        blipSprite = 361,
        blipColour = 63,
        markerType = 29,
        markerColour = { r = 0, g = 119, b = 119 },
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Macken~s~',
        enableBlip = true,
        job = 'all'
    },
}

Config.Stash = {
    ['Polis Förråd'] = {
        coords = vector3(461.17, -982.5, 30.79),
        size = vector3(1.0, 0.1, 1.0),
        job = 'police',
        markerType = 21,
        markerColour = { r = 0, g = 119, b = 119 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['Sjukvård Förråd'] = {
        coords = vector3(349.25, -560.0, 28.85),
        size = vector3(1.0, 0.1, 1.0),
        job = 'ambulance',
        markerType = 21,
        markerColour = { r = 0, g = 119, b = 119 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['Mekonomen Förråd'] = {
        coords = vector3(-329.93, -127.84, 39.10),
        size = vector3(1.0, 0.1, 1.0),
        job = 'mechanic',
        markerType = 21,
        markerColour = { r = 0, g = 119, b = 119 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['Bennys Förråd'] = {
        coords = vector3(-224.21, -1320.18, 30.95),
        size = vector3(1.0, 0.1, 1.0),
        job = 'bennys',
        markerType = 21,
        markerColour = { r = 0, g = 119, b = 119 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['NE Bilcenter'] = {
        coords = vector3(-30.92, -1110.84, 26.50),
        size = vector3(1.0, 0.1, 1.0),
        job = 'cardealer',
        markerType = 21,
        markerColour = { r = 0, g = 119, b = 119 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
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