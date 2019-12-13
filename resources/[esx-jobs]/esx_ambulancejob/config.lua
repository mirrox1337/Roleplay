Config                            = {}

Config.DrawDistance               = 15.0

Config.Marker                     = { type = 27, x = 1.5, y = 1.5, z = 1, r = 0, g = 119, b = 119, a = 225, rotate = true }

Config.ReviveReward               = 700  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'sv'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 30 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(302.78, -569-87.3, 28.79), heading = 248.05 }

Config.Hospitals = {

	PillboxHillMedicalCenter = {

		Blip = {
			coords = vector3(372.79, -594.38, 28.79),
			sprite = 61,
			scale  = 0.8,
			color  = 2
		},

		CloakRoom = {
			vector3(336.07, -580.1, 27.8)
		},

		AmbulanceActions = {
			vector3(327.24, -596.16, 27.8)
		},

		Pharmacies = {
			vector3(353.98, -577.63, 27.8)
		},

		Vehicles = {
			{
				Spawner = vector3(321.56, -557.99, 28.75),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(317.08, -556.25, 27.8), heading = 270.0, radius = 1.5 },
					{ coords = vector3(317.08, -553.46, 27.8), heading = 270.0, radius = 1.5 },
					{ coords = vector3(317.08, -550.66, 27.8), heading = 270.0, radius = 1.5 },
					{ coords = vector3(317.08, -547.83, 27.8), heading = 270.0, radius = 1.5 },
					{ coords = vector3(317.08, -544.97, 27.8), heading = 270.0, radius = 1.5 },
					{ coords = vector3(320.97, -541.74, 27.8), heading = 180.0, radius = 1.5 },
					{ coords = vector3(323.77, -541.74, 27.8), heading = 180.0, radius = 1.5 },
					{ coords = vector3(326.66, -541.74, 27.8), heading = 180.0, radius = 1.5 },
					{ coords = vector3(329.41, -541.74, 27.8), heading = 180.0, radius = 1.5 },
					{ coords = vector3(332.27, -541.74, 27.8), heading = 180.0, radius = 1.5 },
					{ coords = vector3(335.1,  -541.74, 27.8), heading = 180.0, radius = 1.5 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.53, -586.84, 74.2),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.98, -588.05, 74.2), heading = 307.46, radius = 10.0 }
				}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(340.49, -595.32, 27.82),
				To = { coords = vector3(339.2, -584.08, 74.2), heading = 243.5 },
				Marker = { type = 23, x = 1.5, y = 1.5, z = 0.5, r = 25, g = 89, b = 83, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(339.2, -584.08, 73.2),
				To = { coords = vector3(340.49, -595.32, 27.82), heading = 70.0 },
				Marker = { type = 23, x = 1.5, y = 1.5, z = 0.5, r = 25, g = 89, b = 83, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 23, x = 1.5, y = 1.5, z = 0.5, r = 25, g = 89, b = 83, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		},
	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulans', price = 100}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulans', price = 100}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulans', price = 100}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulans', price = 100}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 }
	},

	chief_doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 300000 }
	},

	boss = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }
	}

}
