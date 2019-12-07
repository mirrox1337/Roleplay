Config = {}

Config.Locale = 'sv'
Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000

Config.Shops = {
    ['Barracuda Fiskeshop'] = {
        coords = {
            vector3(-3275.48, 969.75, 7.45),
        },
        items = {
            { name = "fishingrod", price = 125, count = 1 },
            { name = "bait", price = 50, count = 10 },
        },
        blipSprite = 68,
        blipColour = 1,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Barracuda Fiskeshop~s~',
        job = 'all'
    },
    ['Amirs Livs'] = {
        coords = {
            vector3(-1172.36, -1572.19, 3.70),
        },
        items = {
            { name = "rizla", price = 15, count = 1 },
            { name = "cigaretter", price = 50, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "snusdosa", price = 40, count = 1 },
        },
        blipSprite = 52,
        blipColour = 51,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Amirs Livs~s~',
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
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Sjukhus Kiosken~s~',
        job = 'all'
    },
    ['Dealer'] = {
        coords = {
            vector3(-2.82, -1821.54, 28.60),
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
            {name = 'radio', price = 750, count = 1},
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på den ~r~svarta marknaden~s~',
        job = 'all'
    },
    ['7-Eleven'] = {
        coords = {
            vector3(373.875, 325.896, 103.566),
            vector3(2557.458, 382.282, 106.622),
            vector3(-3038.939, 585.954, 7.908),
            vector3(-3241.927, 1001.462, 12.830),
            vector3(547.431, 2671.710, 42.156),
            vector3(1961.464, 3740.672, 32.343),
            vector3(2678.916, 3280.671, 55.241),
            vector3(1729.563, 6414.126, 36.037),
        },
        items = {
            { name = "bread", price = 25, count = 1 },
            { name = "water", price = 20, count = 1 },
        },
        blipSprite = 52,
        blipColour = 15,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        msg = '~INPUT_CONTEXT~ för att handla på ~g~TwentyFourSeven~s~',
        enableBlip = true,
        job = 'all'
    },
    ['Systembolaget'] = {
        coords = {
            vector3(1135.808, -982.281, 46.415),
            vector3(-1222.915, -906.983, 12.326),
            vector3(-1487.553, -379.107, 40.163),
            vector3(-2968.243, 390.910, 15.043),
            vector3(1166.024, 2708.930, 38.157),
            vector3(1392.562, 3604.684, 34.980),
            vector3(-1393.409, -606.624, 30.319),
            vector3(-559.906, 287.093, 82.176),
        },
        items = {
            { name = "beer", price = 25, count = 1 },
            { name = "jager", price = 40, count = 1 },
        },
        blipSprite = 93,
        blipColour = 69,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Systembolaget~s~',
        enableBlip = true,
        job = 'all'
    },
    ['Macken'] = {
        coords = {
            vector3(-48.519, -1757.514, 29.421),
            vector3(1163.373, -323.801, 69.205),
            vector3(-707.501, -914.260, 19.215),
            vector3(-1820.523, 792.518, 138.118),
            vector3(1698.388, 4924.404, 42.063),
        },
        items = {
            { name = "cigaretter", price = 50, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "snusdosa", price = 40, count = 1 },
        },
        blipSprite = 361,
        blipColour = 63,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        msg = '~INPUT_CONTEXT~ för att handla på ~g~Macken~s~',
        enableBlip = true,
        job = 'all'
    },
}

Config.Stash = {
    ['Polis Förråd'] = {
        coords = vector3(461.17, -982.5, 30.69),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['Sjukvård Förråd'] = {
        coords = vector3(349.25, -560.0, 27.8),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ambulance',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['Mekonomen Förråd'] = {
        coords = vector3(-344.38, -128.11, 38.05),
        size = vector3(1.0, 1.0, 1.0),
        job = 'mechanic',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['Bennys Förråd'] = {
        coords = vector3(-224.21, -1320.18, 29.95),
        size = vector3(1.0, 1.0, 1.0),
        job = 'bennys',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att öppna ~g~Förråd~s~'
    },
    ['NE Bilcenter'] = {
        coords = vector3(-30.82, -1110.94, 25.50),
        size = vector3(1.0, 1.0, 1.0),
        job = 'cardealer',
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
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