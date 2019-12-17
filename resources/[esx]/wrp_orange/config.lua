Config = {}

Config.minQuantity = 300
Config.maxQuantity = 500
Config.copsNeeded = 0 -- Cop amount to get max amount of items for selling, SET 0 to disable
Config.chanceToCallPolice = 10  -- percent chance to call the police I.E. 10 = 10%, BTW paste a code to send police a message in client.lua LINE: 254
Config.NPCwalkSpeed = 1.490  -- NPC walk SPEED
Config.sellMode = 2 -- 1 = that the NPC's come to you to buy the drugs, 2 = that you walk up to any NPC and sell it yourself

Config.Locations = {
	["Weed"] = {
		gather = {
			coords = {
				vector3(1240.83, 1905.1, 78.77),
				vector3(1239.18, 1902.39, 78.86)
			},			--coords where everything spawns, there can be more that one spot
			text = "Stisni [~g~E~s~] da uberes vrh",															--3d text
			input = {{item = "orage", amount = 0}},												--input things you can add any amount of different items, as well as any currency
			output ={{item = "orage", amount = 5},},											--output things, you can add any amount of different items, as well as any currency
			animation = {library = "anim@heists@ornate_bank@grab_cash_heels", name = "grab"},	--Picking from the thing animation
			propsToSpawn = {{name = '', heading = 150.0},},				--props that spawn to cover up the location
			min = 350,																			--amount in the containers are limited for unlimited amounts just set this to -1
			max = 650,																			--amount in the containers are limited for unlimited amounts just set this to -1
			amount = 0,																			--Just a placeholder
			msg = "Zapoceo si proces branja",													--Start message
			duration = 5000,																	--action duration
			spawntime = {start = 1, stop = 0}													-- hour when the drugs appear and disappear in town
		},
		proccessing = {	
			coords = {
				vector3(218.13, -2.88, 73.97)
			},											--coords where everything spawns, there can be more that one spot
			text = "Stisni [~g~E~s~] da prepakiras u vrecice",
			input = {{item = "orage", amount = 5}},
			output = {{item = "juice_orage", amount = 1}},
			animation = {library = "anim@heists@ornate_bank@grab_cash_heels", name = "grab"}, 	--Proccessing animation
			propsToSpawn = {name ='prop_cratepile_07a_l1', heading = 150.0},					--props don't spawn here, gotta clean it all up a little
			amount = 0,
			msg = "Poceo si pakirati travu u vrecice!",
			duration = 5000
		},

		sell = {
			coords = {vector3(-690.91, -966.45, 19.89)},
			sellZones = {},
			text = "[~g~E~s~] Sell",
			input = {{item = "juice_orage", amount = 1, max = 100}},								--Currently only support one input item, will add more functionality later on			
			output = {{item = "cash", amount = 300}},											
			animation = {library = "missheistfbisetup1", name = "unlock_loop_janitor"},   		--Hagling animation
			animation2 = {library = "missheistfbisetup1", name = "unlock_loop_janitor"},		--Giving the things animation
			propsToSpawn = {},																	
			amount = 0,
			msg = "You started selling Juice Orage",
			haglingduration = 6000,
			duration = 2000                         -- HOW LONG IT TAKES WHEN A PED APPROACHES THE PLAYER
		},
	},
	--[[["Cocaine"] = {
		gather = {
			coords = { --coords where everything spawns, there can be more that one spot
				vector3() --
			},										
			text = "Stisni [~b~E~s~] da pocnes skupljati",															--3d text
			input = {{item = "torba", amount = 1}},												--input things you can add any amount of different items, as well as any currency
			output ={{item = "coke", amount = 1},},											--output things, you can add any amount of different items, as well as any currency
			animation = {library = "anim@heists@ornate_bank@grab_cash_heels", name = "grab"},	--Picking from the thing animation
			propsToSpawn = {{name = '', heading = 150.0},},				--props that spawn to cover up the location
			min = 350,																			--amount in the containers are limited for unlimited amounts just set this to -1
			max = 650,																			--amount in the containers are limited for unlimited amounts just set this to -1
			amount = 0,																			--Just a placeholder
			msg = "Poceo si skupljati kokain!",														--Start message
			duration = 5000,
			spawntime = {start = 1, stop = 0}	
		},												
		proccessing = {	
			coords = {
				vector3(2433.07, 4969.33, 42.34),},											--coords where everything spawns, there can be more that one spot
			text = "Stisni [~g~E~s~] da prepakiras u vrecice",
			input = {{item = "coke", amount = 5},{item = "vrecica", amount = 1}},
			output = {{item = "coke_pooch", amount = 1},},
			animation = {library = "anim@heists@ornate_bank@grab_cash_heels", name = "grab"}, 	--Proccessing animation
			propsToSpawn = {name ='prop_cratepile_07a_l1', heading = 150.0},
			amount = 0,
			msg = "You started proccessing coke leaves",
			duration = 5000
		},
		sell = {
			coords = {vector3(-690.91, -966.45, 19.89)},
			sellZones = { },
			text = "[~g~E~s~] Sell",
			input = {{item = "marijuana", amount = 1, max = 7}},								--Currently only support one input item, will add more functionality later on			
			output = {{item = "cash", amount = 300, max = 400}, {item = "black_money", amount = 100, max = 200}},											
			animation = {library = "missheistfbisetup1", name = "unlock_loop_janitor"},   		--Hagling animation
			animation2 = {library = "missheistfbisetup1", name = "unlock_loop_janitor"},		--Giving the things animation
			propsToSpawn = {},																	
			amount = 0,
			msg = "You started selling weed",
			haglingduration = 6000,
			duration = 2000                         -- HOW LONG IT TAKES WHEN A PED APPROACHES THE PLAYER
		},
	},]]
}
