Config = {}

Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = false
Config.HotKeyCooldown = 1000

Config.Shops = {
    ['Aladdins Fiskebutik'] = {
        coords = {
            vector3(814.59, -93.13, 79.7),
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
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Aladdins Fiskebutik~s~',
        job = 'all'
    },
    ['Mohammeds Livs'] = {
        coords = {
            vector3(-1172.07, -1571.93, 3.70),
        },
        items = {
            { name = "cigarett", price = 60, count = 20 },
            { name = "lighter", price = 10, count = 1 },
            { name = "rizla", price = 15, count = 1 },
        },
        blipSprite = 106,
        blipColour = 38,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = true,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Mohammeds Livs~s~',
        job = 'all'
    },
    ['UrbicusBar'] = {
        coords = {
            vector3(-562.07, 288.27, 81.28),
        },
        items = {
            { name = "ol", price = 65, count = 1 },
            { name = "whisky", price = 105, count = 1 },
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla på ~p~Urbicus Bar~s~',
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
            {name = 'silencieux', price = 7500, count = 1},
			{name = 'flashlight', price = 4000, count = 1},
			{name = 'seed', price = 5000, count = 1},
			{name = 'rizla', price = 30, count = 30},
			{name = 'kaustiksoda', price = 50, count = 1},
			{name = 'cement', price = 50, count = 1},
			{name = 'bensin', price = 600, count = 1},
			{name = 'clip', price = 600, count = 1},
			{name = 'Våg', price = 500, count = 1},
			{name = 'grinder', price = 500, count = 1},
			{name = 'plasticbag', price = 15, count = 10},
			{name = 'lockpick', price = 200, count = 1},
			{name = 'radio', price = 900, count = 1},
			{name = 'buntband', price = 20, count = 1},
			{name = 'chemicals', price = 400, count = 1},
			{name = 'jumelles', price = 450, count = 1},
			{name = 'turtlebait', price = 25, count = 1},
			{name = 'methlab', price = 2300, count = 1},
			{name = 'acetone', price = 90, count = 1},
			{name = 'lithium', price = 25, count = 1},
			{name = 'bulletproof_vest', price = 1500, count = 1}
        },
        blipSprite = 52,
        blipColour = 4,
        markerType = 27,
        markerColour = { r = 196, g = 42, b = 190 },
        enableBlip = false,
        rotate = true,
        msg = '~INPUT_CONTEXT~ för att handla hos ~r~Dealer~s~',
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
        coords = vector3(-321.26, -138.01, 38.05),
        size = vector3(1.0, 1.0, 1.0),
        job = 'mecano',
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