Config                            = {}

Config.DrawDistance               = 15.0

Config.Marker                     = { type = 27, x = 1.5, y = 1.5, z = 1, r = 119, g = 18, b = 130, a = 225, rotate = true }

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
			coords = vector3(340.01, -584.21, 28.79),
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
					{ coords = vector3(315.82, -545.27, 27.8), heading = 281.75, radius = 4.0 },
					{ coords = vector3(315.79, -550.81, 27.8), heading = 273.13, radius = 4.0 },
					{ coords = vector3(323.66, -541.32, 27.8), heading = 181.23, radius = 6.0 }
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
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		},
	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 5000}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 4500}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 3000}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 2000}
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
