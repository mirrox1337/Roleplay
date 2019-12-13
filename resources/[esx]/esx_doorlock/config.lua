Config = {}
Config.Locale = 'sv'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objYaw = 30.0,
		objCoords  = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_shrf2door',
				objYaw = -45.0,
				objCoords  = vector3(-443.1, 6015.6, 31.7),
			},

			{
				objName = 'v_ilev_shrf2door',
				objYaw = 135.0,
				objCoords  = vector3(-443.9, 6016.6, 31.7)
			}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(420.1, -1017.3, 28.0),
		textCoords = vector3(420.1, -1021.0, 32.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
	-- Double doors for extended PD
	{
		textCoords = vector3(465.55, -990.00, 25.00),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
	{
	objName = 'v_ilev_ph_gendoor005',
	objYaw = 90.0,
	objCoords = vector3(465.55, -989.45, 24.91)
	},

	{
	objName = 'v_ilev_ph_gendoor005',
	objYaw = -90.0,
	objCoords = vector3(465.60, -990.63, 24.91)
	}
}
},

-- Cell 4 (Left 1)
{
	objName = 'v_ilev_ph_cellgate',
	objYaw = 90.0,
	objCoords  = vector3(466.03, -998.55, 24.9149),
	textCoords = vector3(466.02, -998.75, 25.064),
	authorizedJobs = { 'police' },
	locked = true
},

-- Cell 5 (Left 2)
{
	objName = 'v_ilev_ph_cellgate',
	objYaw = 90.0,
	objCoords  = vector3(466.12, -1002.16, 24.9149),
	textCoords = vector3(466.02, -1002.35, 25.064),
	authorizedJobs = { 'police' },
	locked = true
},

-- Interrogation wing cell left
{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -0.0,
	objCoords  = vector3(482.02, -988.35, 24.91),
	textCoords = vector3(481.6, -988.35, 25.064),
	authorizedJobs = { 'police' },
	locked = true
},

-- Interrogation wing cell right
{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -0.0,
	objCoords  = vector3(481.86, -991.61, 24.91),
	textCoords = vector3(481.46, -991.61, 25.064),
	authorizedJobs = { 'police' },
	locked = true
},

-- To interrogation observation room left
{
	objName = 'v_ilev_ph_gendoor005',
	objYaw = -0.0,
	objCoords  = vector3(472.01, -988.3, 24.91),
	textCoords = vector3(472.01, -988.3, 24.91),
	authorizedJobs = { 'police' },
	locked = true
},
-- To interrogation room left
{
	objName = 'v_ilev_ph_gendoor005',
	objYaw = -0.0,
	objCoords  = vector3(477.52, -988.44, 24.91),
	textCoords = vector3(477.52, -988.44, 24.91),
	authorizedJobs = { 'police' },
	locked = true
},
-- To interrogation observation room right
{
	objName = 'v_ilev_ph_gendoor005',
	objYaw = -0.0,
	objCoords  = vector3(472.02, -991.62, 24.91),
	textCoords = vector3(472.02, -991.62, 24.91),
	authorizedJobs = { 'police' },
	locked = true
},
-- To interrogation room right
{
	objName = 'v_ilev_ph_gendoor005',
	objYaw = -0.0,
	objCoords  = vector3(477.56, -991.56, 24.91),
	textCoords = vector3(477.56, -991.56, 24.91),
	authorizedJobs = { 'police' },
	locked = true
},
--Sjukhus
{
	textCoords = vector3(334.11, -592.23, 29.79),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 70.0,
			objCoords = vector3(334.57540, -591.24450, 28.80277)
		},

		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = -110.0,
			objCoords = vector3(333.78850, -593.40550, 28.80277)
		}
	}
},
{
	objName = 'v_ilev_cor_offdoora',
	objYaw = 160.0,
	objCoords  = vector3(323.71960, -590.71240, 28.93845),
	textCoords = vector3(324.2, -591.06, 29.53845),
	authorizedJobs = { 'ambulance' },
	locked = true
},
{
	textCoords = vector3(346.17, -568.25, 29.59),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 160.0,
			objCoords = vector3(345.05860, -567.96480, 28.82051)
		},

		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 340.0,
			objCoords = vector3(347.22670, -568.73330, 28.82051)
		}
	}
},
{
	textCoords = vector3(346.36, -573.11, 29.59),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 70.0,
			objCoords = vector3(346.81810, -572.02560, 28.82051)
		},

		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = -110.0,
			objCoords = vector3(346.03100, -574.18880, 28.82051)
		}
	}
},
{
	textCoords = vector3(320.0, -560.53, 29.59),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'hei_prop_heist_cutscene_doorc_r',
			objYaw = 206.629,
			objCoords = vector3(318.76770, -561.01980, 28.88031)
		},

		{
			objName = 'hei_prop_heist_cutscene_doorc_r',
			objYaw = 25.941,
			objCoords = vector3(321.00880, -559.96090, 28.88031)
		}
	}
},
{
	textCoords = vector3(317.74, -588.54, 29.79),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_darkdoor',
			objYaw = 340.105,
			objCoords = vector3(318.94050, -588.97810, 28.98365)
		},

		{
			objName = 'v_ilev_cor_darkdoor',
			objYaw = 159.840,
			objCoords = vector3(316.51670, -588.09580, 28.98365)
		}
	}
},
{
	textCoords = vector3(313.72150, -580.85, 29.81984),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 160.0,
			objCoords = vector3(312.72150, -580.42040, 28.81984)
		},

		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 340.269,
			objCoords = vector3(314.88360, -581.20760, 28.81984)
		}
	}
},
{
	textCoords = vector3(341.87, -571.42, 29.81984),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 250.0,
			objCoords = vector3(341.39200, -572.50710, 28.81897)
		},

		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 70.0,
			objCoords = vector3(342.17840, -570.34730, 28.81897)
		}
	}
},
{
	textCoords = vector3(336.75, -571.83, 29.81984),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_doorglassb',
			objYaw = 340.0,
			objCoords = vector3(337.99130, -572.20840, 28.93973)
		},

		{
			objName = 'v_ilev_cor_doorglassa',
			objYaw = 340.0,
			objCoords = vector3(335.56880, -571.33120, 28.93973)
		}
	}
},
{
	textCoords = vector3(330.15, -569.45, 29.81984),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_doorglassb',
			objYaw = 340.0,
			objCoords = vector3(331.38260, -569.80820, 28.93973)
		},

		{
			objName = 'v_ilev_cor_doorglassa',
			objYaw = 340.0,
			objCoords = vector3(328.95720, -568.92450, 28.93973)
		}
	}
},
{
	textCoords = vector3(322.05, -566.45, 29.81984),
	authorizedJobs = { 'ambulance' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 340.0,
			objCoords = vector3(323.12310, -566.95920, 28.82303)
		},

		{
			objName = 'v_ilev_cor_firedoor',
			objYaw = 160.0,
			objCoords = vector3(320.95690, -566.17060, 28.82303)
		}
	}
},
--Bilfirman
{
	textCoords = vector3(-38.2, -1108.45, 27.70980),
	authorizedJobs = { 'cardealer' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_csr_door_l',
			objYaw = 340.0,
			objCoords = vector3(-39.13366, -1108.21800, 26.71980)
		},

		{
			objName = 'v_ilev_csr_door_r',
			objYaw = 340.0,
			objCoords = vector3(-37.33113, -1108.87300, 26.71980)
		}
	}
},
{
	textCoords = vector3(-60.2, -1093.88, 27.70980),
	authorizedJobs = { 'cardealer' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_csr_door_l',
			objYaw = 250.0,
			objCoords = vector3(-59.89302, -1092.95200, 26.71980)
		},

		{
			objName = 'v_ilev_csr_door_r',
			objYaw = 250.0,
			objCoords = vector3(-60.54582, -1094.74900, 26.71980)
		}
	}
},
{
	textCoords = vector3(-32.05, -1102.55, 27.60980),
	authorizedJobs = { 'cardealer' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_fib_door1',
			objYaw = 70.0,
			objCoords = vector3(-31.72353, -1101.84700, 26.71980)
		}
	}
},
{
	textCoords = vector3(-34.05, -1108.33, 27.60980),
	authorizedJobs = { 'cardealer' },
	locked = true,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_fib_door1',
			objYaw = 70.0,
			objCoords = vector3(-33.80989, -1107.57900, 26.57225)
		}
	}
},
--Bennys
{
	textCoords = vector3(-206.02, -1310.66, 31.3),
	authorizedJobs = { 'cardealer' },
	locked = true,
	distance = 12.0,
	doors = {
		{
			objName = 'lr_prop_supermod_door_01',
			objCoords = vector3(-205.68280, -1310.68300, 30.29771)
		}
	}
},
}