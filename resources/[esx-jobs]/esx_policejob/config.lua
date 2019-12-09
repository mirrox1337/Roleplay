Config                            = {}

Config.DrawDistance               = 5.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'sv'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 78
		},

		Cloakrooms = {
			vector3(452.600, -993.306, 30.69)
		},

		Armories = {
			vector3(452.09, -973.32, 30.69)
		},

		Vehicles = {
			{
				Spawner = vector3(457.92, -1010.66, 28.28),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(446.17, -1025.76, 27.7), heading = 1.75, radius = 6.0 },
					{ coords = vector3(442.35, -1026.63, 27.74), heading = 1.75, radius = 6.0 },
					{ coords = vector3(438.61, -1026.55, 27.8), heading = 1.75, radius = 6.0 },
					{ coords = vector3(434.87, -1026.98, 27.85), heading = 1.75, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(459.4, -983.93, 43.69),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.417, -973.208, 30.69)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 1500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},

	officer = {
		--{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500},
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 5000 },
		{ weapon = 'WEAPON_SMG', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 10000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 13000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 20000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1000 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_FIREEXTINGUISHER', price = 500 },
		{ weapon = 'WEAPON_FLAREGUN', price = 1000 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {

	},

	recruit = {
    { model = 'police', label = 'Volkswagen Passat', price = 1 }
	},

	officer = {
		{ model = 'police', label = 'Volkswagen Passat', price = 1 },
		{ model = 'police2', label = 'Volvo V90 CC', price = 1 },
		{ model = 'police3', label = 'Volvo XC90', price = 1 }
	},

	sergeant = {
		{ model = 'police', label = 'Volkswagen Passat', price = 1 },
		{ model = 'police2', label = 'Volvo V90 CC', price = 1 },
		{ model = 'police3', label = 'Volvo XC90', price = 1 },
		{ model = 'policeb', label = 'BMW 1200R', price = 1 },
		{ model = 'sheriff', label = 'Volkswagen T6', price = 1 },
		{ model = 'police4', label = 'BMW 540i xDrive - Civil', price = 1 },
		{ model = 'fbi', label = 'Volvo V90 CC - Civil', price = 1 },
		{ model = 'policeold2', label = 'Volkswagen T6 - Civil', price = 1 }
	},

	intendent = {
		{ model = 'police', label = 'Volkswagen Passat', price = 1 },
		{ model = 'police2', label = 'Volvo V90 CC', price = 1 },
		{ model = 'police3', label = 'Volvo XC90', price = 1 },
		{ model = 'policeb', label = 'BMW 1200R', price = 1 },
		{ model = 'sheriff', label = 'Volkswagen T6', price = 1 },
		{ model = 'police4', label = 'BMW 540i xDrive - Civil', price = 1 },
		{ model = 'fbi', label = 'Volvo V90 CC - Civil', price = 1 },
		{ model = 'policeold2', label = 'Volkswagen T6 - Civil', price = 1 }
	},

	lieutenant = {
		{ model = 'police', label = 'Volkswagen Passat', price = 1 },
		{ model = 'police2', label = 'Volvo V90 CC', price = 1 },
		{ model = 'police3', label = 'Volvo XC90', price = 1 },
		{ model = 'policeb', label = 'BMW 1200R', price = 1 },
		{ model = 'sheriff', label = 'Volkswagen T6', price = 1 },
		{ model = 'police4', label = 'BMW 540i xDrive - Civil', price = 1 },
		{ model = 'fbi', label = 'Volvo V90 CC - Civil', price = 1 },
		{ model = 'policeold2', label = 'Volkswagen T6 - Civil', price = 1 }
	},

	chef = {
    { model = 'police', label = 'Volkswagen Passat', price = 1 },
    { model = 'police2', label = 'Volvo V90 CC', price = 1 },
    { model = 'police3', label = 'Volvo XC90', price = 1 },
    { model = 'policeb', label = 'BMW 1200R', price = 1 },
    { model = 'sheriff', label = 'Volkswagen T6', price = 1 },
    { model = 'police4', label = 'BMW 540i xDrive - Civil', price = 1 },
    { model = 'fbi', label = 'Volvo V90 CC - Civil', price = 1 },
    { model = 'policeold2', label = 'Volkswagen T6 - Civil', price = 1 }
	},

	boss = {
    { model = 'police', label = 'Volkswagen Passat', price = 1 },
    { model = 'police2', label = 'Volvo V90 CC', price = 1 },
    { model = 'police3', label = 'Volvo XC90', price = 1 },
    { model = 'policeb', label = 'BMW 1200R', price = 1 },
    { model = 'sheriff', label = 'Volkswagen T6', price = 1 },
    { model = 'police4', label = 'BMW 540i xDrive - Civil', price = 1 },
    { model = 'fbi', label = 'Volvo V90 CC - Civil', price = 1 },
    { model = 'policeold2', label = 'Volkswagen T6 - Civil', price = 1 }

	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
      recruit_wear = {
        male = {
          ['tshirt_1'] = 53, ['tshirt_2'] = 0,
          ['torso_1'] = 193, ['torso_2'] = 0,
		      ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 59, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
		      ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 13, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 27, ['tshirt_2'] = 0,
          ['torso_1'] = 163, ['torso_2'] = 0,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 40,
          ['pants_1'] = 61, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
          ['glasses_1'] = 5, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 14, ['bproof_2'] = 0,
        }
      },
      officer_wear = {
        male = {
          ['tshirt_1'] = 53, ['tshirt_2'] = 0,
          ['torso_1'] = 193, ['torso_2'] = 1,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 59, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
		      ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 13, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 27, ['tshirt_2'] = 0,
          ['torso_1'] = 163, ['torso_2'] = 1,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 40,
          ['pants_1'] = 61, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
          ['glasses_1'] = 5, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 14, ['bproof_2'] = 0,
        }
      },
      sergeant_wear = {
        male = {
          ['tshirt_1'] = 53, ['tshirt_2'] = 0,
          ['torso_1'] = 193, ['torso_2'] = 2,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 59, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
		      ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 13, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 27, ['tshirt_2'] = 0,
          ['torso_1'] = 163, ['torso_2'] = 2,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 40,
          ['pants_1'] = 61, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
          ['glasses_1'] = 5, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 14, ['bproof_2'] = 0,
        }
      },
      insats_wear = {
        male = {
          ['tshirt_1'] = 15, ['tshirt_2'] = 0,
          ['torso_1'] = 49, ['torso_2'] = 0,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 33,
          ['pants_1'] = 31, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
	        ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 8, ['chain_2'] = 0,
          ['mask_1'] = 0, ['mask_2'] = 0,
		      ['bags_1'] = 0, ['bags_2'] = 0,
          ['bproof_1'] = 16, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 34, ['tshirt_2'] = 0,
          ['torso_1'] = 42, ['torso_2'] = 0,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 18,
          ['pants_1'] = 30, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
	        ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 8, ['chain_2'] = 0,
          ['mask_1'] = 0, ['mask_2'] = 0,
		      ['bags_1'] = 0, ['bags_2'] = 0,
          ['bproof_1'] = 18, ['bproof_2'] = 0,
        }
      },
      lieutenant_wear = { -- currently the same as intendent_wear
        male = {
          ['tshirt_1'] = 53, ['tshirt_2'] = 0,
          ['torso_1'] = 193, ['torso_2'] = 3,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 59, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
	        ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 13, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 27, ['tshirt_2'] = 0,
          ['torso_1'] = 163, ['torso_2'] = 3,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 40,
          ['pants_1'] = 61, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
          ['glasses_1'] = 5, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 14, ['bproof_2'] = 0,
        }
      },
      chef_wear = {
        male = {
          ['tshirt_1'] = 53, ['tshirt_2'] = 0,
          ['torso_1'] = 193, ['torso_2'] = 4,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 59, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
		      ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 13, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 27, ['tshirt_2'] = 0,
          ['torso_1'] = 163, ['torso_2'] = 4,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 40,
          ['pants_1'] = 61, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
          ['glasses_1'] = 5, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 14, ['bproof_2'] = 0,
        }
      },
      boss_wear = { -- currently the same as chef_wear
        male = {
          ['tshirt_1'] = 53, ['tshirt_2'] = 0,
          ['torso_1'] = 193, ['torso_2'] = 4,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 59, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
		      ['glasses_1'] = -1, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 13, ['bproof_2'] = 0,
        },
        female = {
          ['tshirt_1'] = 27, ['tshirt_2'] = 0,
          ['torso_1'] = 163, ['torso_2'] = 4,
          ['decals_1'] = 0, ['decals_2'] = 0,
          ['arms'] = 40,
          ['pants_1'] = 61, ['pants_2'] = 0,
          ['shoes_1'] = 25, ['shoes_2'] = 0,
          ['helmet_1'] = -1, ['helmet_2'] = 0,
          ['glasses_1'] = 5, ['glasses_2'] = 0,
          ['chain_1'] = 1, ['chain_2'] = 0,
          ['mask_1'] = 121, ['mask_2'] = 0,
          ['bproof_1'] = 14, ['bproof_2'] = 0,
        }
      },
      bulletsvart_wear = {
        male = {
          ['bags_1'] = 4, ['bags_2'] = 0
        },
        female = {
          ['bags_1'] = 2, ['bags_2'] = 0
        }
      },
      gilet_wear = {
        male = {
          ['tshirt_1'] = 0,  ['tshirt_2'] = 0
        },
        female = {
          ['tshirt_1'] = 0,  ['tshirt_2'] = 0
        }
      },
	  befel_vast = {
        male = {
          ['bproof_1'] = 15, ['bproof_2'] = 2
        },
        female = {
          ['bproof_1'] = 2, ['bproof_2'] = 0
        }
      },
	  insats_vast = {
        male = {
          ['bproof_1'] = 4, ['bproof_2'] = 0
        },
        female = {
          ['bproof_1'] = 13, ['bproof_2'] = 1
        }
      }
    }