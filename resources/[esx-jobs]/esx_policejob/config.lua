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
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.600, -993.306, 30.69)
		},

		Armories = {
			vector3(456.39144897461, -982.91027832031, 30.69)
		},

		Vehicles = {
			{
				Spawner = vector3(457.92, -1010.66, 28.28),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
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
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 1500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 690},
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 9199 },
		{ weapon = 'WEAPON_ASSAULTSMG', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 15899 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 12499 },
		{ weapon = 'WEAPON_STUNGUN', price = 4999 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 999 },
		{ weapon = 'WEAPON_FIREEXTINGUISHER', price = 495 },
		{ weapon = 'WEAPON_FLAREGUN', price = 4499 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'police', label = 'Volvo XC70', price = 10000 },
		{ model = 'police2', label = 'Volvo V90 CC', price = 10000 },
		{ model = 'police3', label = 'Volkswagen Buss', price = 10000 },
		{ model = 'policeb', label = 'BMW 1200R', price = 10000 },
		{ model = 'policevw', label = 'Volkswagen Transport', price = 10000 },
		{ model = 'police4', label = 'Volkswagen Golf - Civil', price = 10000 },
		{ model = 'fbi', label = 'Volvo V90 CC - Civil', price = 10000 },
		{ model = 'policeold2', label = 'Volkswagen Buss - Civil', price = 10000 }
	},

	recruit = {

	},

	officer = {
		{ model = 'police3', label = 'Police Interceptor', price = 20000 }
	},

	sergeant = {
		{ model = 'policet', label = 'Police Transporter', price = 18500 },
		{ model = 'policeb', label = 'Police Bike', price = 30500 }
	},

	intendent = {

	},

	lieutenant = {
		{ model = 'riot', label = 'Police Riot', price = 70000 },
		{ model = 'fbi2', label = 'FIB SUV', price = 60000 }
	},

	chef = {

	},

	boss = {

	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 200000 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 150000 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 100000 }
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