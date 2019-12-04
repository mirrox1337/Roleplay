Config                        	= {}
Config.CopsScaleReward			= true

-- Change this to false if you want clean / legit money
Config.UsesBlackMoney			= false

--Hash of the npc ped. Change only if you know what you are doing.
Config.NPCHash					= -412008429	

--Random time societies will get alerted. This is a range in seconds.
Config.AlertCopsDelayRangeStart	= 60
Config.AlertCopsDelayRangeEnd	= 70

--If you want to notify more societies add them here. example { "mafia", "bikers" }
Config.AlertExtraSocieties 		= { }

--Self Explained
Config.CargoProviderLocation	= { x = 1001.22, y = -2901.34, z = 4.9, h = 180.38 }


Config.CargoDeliveryLocations 	= {

		{ x = 205.8, y = 2801.57, z = 44.66 },
		{ x = 3695.59, y = 4557.45, z = 24.48 },
		{ x = 1966.34, y = 5163.25, z = 46.44},
		{ x = 203.2, y = 6386.39, z = 30.4}

}


Config.Scenarios = {
	
	{ 
		SpawnPoint = { x = 989.1, y = -2973.38, z = 5.9, h = 357.76 }, 
		DeliveryPoint = 6.0,
		VehicleName = "burrito3",
		MinCopsOnline = 4,
		CargoCost = 7500,
		CargoReward = 200
	
	},

	{ 
		SpawnPoint = { x = 989.1, y = -2973.38, z = 5.9, h = 357.76 }, 
		DeliveryPoint = 6.0,
		VehicleName = "boxville",
		MinCopsOnline = 5,
		CargoCost = 18000,
		CargoReward = 400
	
	},
	{ 
		SpawnPoint = { x = 989.1, y = -2973.38, z = 5.9, h = 357.76 },  
		DeliveryPoint = 6.0,
		VehicleName = "mule",
		MinCopsOnline = 6,
		CargoCost = 40000,
		CargoReward = 750
	
	}
}