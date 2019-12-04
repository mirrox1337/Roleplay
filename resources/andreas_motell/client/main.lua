--------------
--== KEYS ==--
--------------
local Keys = {
	["ESC"] = 322,
	["E"] = 38,
}

------------------------
--== CORE THREADING ==--
------------------------
ESX = nil
local Pickups = {}
local PlayerData = {}
local MotelDoorEntered = nil

local Instance                = {}
local InstanceInvite          = nil
local InstancedPlayers        = {}
local RegisteredInstanceTypes = {}
local InsideInstance          = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  local coords = GetEntityCoords(GetPlayerPed(-1))
  PlayerData = xPlayer   
  if(GetDistanceBetweenCoords(coords, 151.49536, -1007.76563, -99.85, true) < 30.0) then
	Wait(10)
	SetEntityCoords(GetPlayerPed(-1), 329.02868652344, -200.75366210938, 53.22643661499)
  end
end)

------------------
--== BUY ROOM ==--
------------------

function OpenBuyMenu()

	ESX.UI.Menu.CloseAll()

  	local elements = {}

		ESX.TriggerServerCallback('andreas_motell:getMotellList', function(data)
			for i=1, #data, 1 do
				table.insert(elements, {label = ('Rum #') .. data[i].DoorNumber .. ' ['.. data[i].RoomPrice .. ' KR]', value = 'kop', price = data[i].RoomPrice, shop = data[i].DoorNumber})
			end
				ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'buy',
				{
					title    = 'Reception',
					align    = 'center',
					elements = elements
				},
				function(data, menu)
					if data.current.value == 'kop' then
						menu.close()
						TriggerServerEvent('andreas_motells:BuyRoom', data.current.price, data.current.shop, data.current.bought)
					end
				end)
			end,
		function(data, menu)
		menu.close()
	end)
end

-----------------
--== MARKERS ==--
-----------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		local pP = GetPlayerPed(-1)

		-- Buymenu
        for k, v in pairs(Config.BuyMenu) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 2.0) then
				Draw3DText(v.x, v.y, v.z, '~p~[E]~w~ För att köpa ett rum', 1.0)
				DrawMarker(25, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 100, false, true, 2, false, false, false, false)
				if IsControlJustPressed(0, Keys['E']) then
					--ESX.TriggerServerCallback('andreas_motell:checkRoom', function(hasRoom)
					--	if hasRoom then
					--		ESX.ShowNotification('Du har redan ett motellrum')
					--	else
							OpenBuyMenu()
					--		Citizen.Wait(1000)
					--	end
					--end)
				end
			end
		end

		-- Entreable doors
        for k, v in pairs(Config.Doors) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.0) then
				Draw3DText(v.x, v.y, v.z + 0.3, '~p~[E]~w~ Gå in ~p~(Rum: ' .. v.number .. ')', 1.0)
				DrawMarker(25, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 100, false, true, 2, false, false, false, false)
				if IsControlJustPressed(0, Keys['E']) then
					getData(v.number)
					position = GetEntityCoords(GetPlayerPed(-1))
					MotelDoorEntered = position
                    Citizen.Wait(1000)
				end
			end
		end
		
		-- Exit
        if(GetDistanceBetweenCoords(coords, 151.37, -1007.94, -99.0, true) < 2.0) then
			Draw3DText( 151.37, -1007.94, -99.0, '~p~[E]~w~ Gå ut ur rummet', 2.0)
			DrawMarker(25, 151.37, -1007.94, -99.0 - 0.99, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 100, false, true, 2, false, false, false, false)
			if IsControlJustPressed(0, Keys['E']) then
				SetEntityCoords(GetPlayerPed(-1), MotelDoorEntered)
				TriggerEvent('instance:close')
				TriggerEvent('instance:onClose', 'motell_instance')
            end
		end

		-- Warderobe
		if(GetDistanceBetweenCoords(coords, 151.72, -1001.32, -98.99, true) < 0.8) then
			Draw3DText(151.72, -1001.32, -98.99, '~p~[E]~w~ Öppna garderob')
			if IsControlJustPressed(0, Keys[('E')]) then
				OpenWarderobeMenu()
			end
		end

		-- Bed
		if(GetDistanceBetweenCoords(coords, 154.14, -1005.89, -98.99, true) < 0.8) then
			Draw3DText(154.14, -1005.89, -98.99, '~p~[E]~w~ Ligg i sängen')
			if IsControlJustPressed(0, Keys[('E')]) then
				SetEntityCoords(pP, 154.31, -1004.58, -99.31)
				SetEntityHeading(pP, 275.68)
				TaskStartScenarioInPlace(pP, 'WORLD_HUMAN_SUNBATHE_BACK', 0, true)
			end
		end

		-- Storage
		if(GetDistanceBetweenCoords(coords, 151.28, -1003.18, -98.99, true) < 0.8) then
			Draw3DText(151.28, -1003.18, -98.99, '~p~[E]~w~ Öppna byrå')
			if IsControlJustPressed(0, Keys[('E')]) then
				OpenStorageMenu()
			end
		end

		-- Shower
		--if(GetDistanceBetweenCoords(coords, 154.96, -1000.23, -98.99, true) < 1.2) then
		--	Draw3DText(154.96, -1000.23, -98.99, '~p~[E]~w~ Ta en dusch')
		--	if IsControlJustPressed(0, Keys[('E')]) then
		--		TakeShower()
		--	end
		--end
    end
end)

----------------
--== EVENTS ==--
----------------

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'motell_instance' then
		TriggerEvent('instance:enter', instance)
	end
end)
RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(instance)
	if instance.type == 'motell_instance' then
		local motell_instance = Getmotell_instance(instance.data.motell_instance)
		local isHost   = GetPlayerFromServerId(instance.host) == PlayerId()
		local isOwned  = false
	end
end)
RegisterNetEvent('instance:onPlayerLeft')
AddEventHandler('instance:onPlayerLeft', function(instance, player)
	if player == instance.host then
		TriggerEvent('instance:leave')
	end
end)
AddEventHandler('instance:loaded', function()
	TriggerEvent('instance:registerType', 'motell_instance', function(instance)
		Entermotell_instance(instance.data.motell_instance, instance.data.owner)
	end, function(instance)
		Exitmotell_instance(instance.data.motell_instance)
	end)
end)


-------------------
--== FUNCTIONS ==--
-------------------

--function OpenExitMenu()
--
--	ESX.UI.Menu.CloseAll()
--
--    ESX.UI.Menu.Open(
--        'default', GetCurrentResourceName(), 'bank_menu',
--        {
--            title    = 'Motellrum',
--            elements = {
--				{label = 'Bjud in kompis', value = 'invite'},
--				{label = 'Gå ut ur rum', value = 'exit'},
--            }
--        },
--        function(data, menu)
--			if data.current.value == 'invite' then
--
--				local playersInArea = ESX.Game.GetPlayersInArea(MotelDoorEntered, 5.0)
--				local elements      = {}
--	
--				for i=1, #playersInArea, 1 do
--					if playersInArea[i] ~= PlayerId() then
--						table.insert(elements, {label = GetPlayerName(playersInArea[i]), value = playersInArea[i]})
--					end
--				end
--	
--				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite', {
--					title    = 'Bjud in person',
--					align    = 'top-left',
--					elements = elements,
--				}, function(data2, menu2)
--					TriggerEvent('instance:invite', 'motell_instance', {motell_instance = locationId, owner = ESX.GetPlayerData().identifier})
--					ESX.ShowNotification('Du bjöd in', GetPlayerName(data2.current.value))
--				end, function(data2, menu2)
--					menu2.close()
--				end)
--			end
--
--            if data.current.value == 'exit' then
--				SetEntityCoords(GetPlayerPed(-1), MotelDoorEntered)
--				TriggerEvent('instance:close')
--				TriggerEvent('instance:onClose', 'motell_instance')
--            end
--        end,
--        function(data, menu)
--            menu.close()
--        end
--    )
--
--end

--function TakeShower()
--
--	ESX.ShowNotification('dusch')
--
--end

function OpenStorageMenu()

	ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'bank_menu',
        {
            title    = 'Byrå',
            elements = {
				{label = 'Lägg in föremål', value = 'get'},
				{label = 'Ta ut föremål', value = 'put'},
            }
        },
        function(data, menu)
            if data.current.value == 'put' then
                OpenRoomInventoryMenu() 
            end  

            if data.current.value == 'get' then
                OpenPlayerInventoryMenu()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )

end

function OpenRoomInventoryMenu()

	ESX.TriggerServerCallback('andreas_motell:getPropertyInventory', function(inventory)

		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name) .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_inventory',
		{
			title    = 'Innehåll',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then

				menu.close()

				TriggerServerEvent('andreas_motell:getItem', owner, data.current.type, data.current.value, data.current.ammo)
				ESX.SetTimeout(300, function()
					OpenRoomInventoryMenu(motell_instance, owner)
				end)

			else

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count', {
					title = _U('amount')
				}, function(data2, menu)

					local quantity = tonumber(data2.value)
					if quantity == nil then
						ESX.ShowNotification(_U('amount_invalid'))
					else
						menu.close()

						TriggerServerEvent('andreas_motell:getItem', owner, data.current.type, data.current.value, quantity)
						ESX.SetTimeout(300, function()
							OpenRoomInventoryMenu(motell_instance, owner)
						end)
					end

				end, function(data2,menu)
					menu.close()
				end)

			end

		end, function(data, menu)
			menu.close()
		end)

	end, owner)

end

function OpenPlayerInventoryMenu()

	ESX.TriggerServerCallback('andreas_motell:getPlayerInventory', function(inventory)

		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. '<span style="color: green;">' .. item.count .. 'st',
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label .. ' [' .. weapon.ammo .. ']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory',
		{
			title    = 'Lägg in förenål',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then

				menu.close()
				TriggerServerEvent('andreas_motell:putItem', owner, data.current.type, data.current.value, data.current.ammo)

				ESX.SetTimeout(300, function()
					OpenPlayerInventoryMenu(motell_instance, owner)
				end)

			else

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
					title = _U('amount')
				}, function(data2, menu2)

					local quantity = tonumber(data2.value)

					if quantity == nil then
						ESX.ShowNotification(_U('amount_invalid'))
					else

						menu2.close()

						TriggerServerEvent('andreas_motell:putItem', owner, data.current.type, data.current.value, tonumber(data2.value))
						ESX.SetTimeout(300, function()
							OpenPlayerInventoryMenu(motell_instance, owner)
						end)
					end

				end, function(data2, menu2)
					menu2.close()
				end)

			end

		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenWarderobeMenu()

	ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerDressing', function(dressing)
		local elements = {}

		for i=1, #dressing, 1 do
		  table.insert(elements, {label = dressing[i], value = i})
	  	end

	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'player_dressing',
		  {
			  title = 'Din garderob',
			  align = 'top-left',
			  elements = elements,
		  },
		  function(data, menu)
			  TriggerEvent('skinchanger:getSkin', function(skin)
				  ESX.TriggerServerCallback('esx_eden_clotheshop:getPlayerOutfit', function(clothes)
					  TriggerEvent('skinchanger:loadClothes', skin, clothes)
					  TriggerEvent('esx_skin:setLastSkin', skin)

					  TriggerEvent('skinchanger:getSkin', function(skin)
						  TriggerServerEvent('esx_skin:save', skin)
					  end)
					 end, data.current.value)
			   end)
		  end,
		  function(data, menu)
			  menu.close()
		  end
	  )
	end)

end

function enterRoom(locationId)

	-- ANIMATION --
    RequestAnimDict("anim@heists@humane_labs@finale@keycards")
    while not HasAnimDictLoaded( "anim@heists@humane_labs@finale@keycards") do
        Citizen.Wait(0)
	end
	TaskPlayAnim(GetPlayerPed(-1), "anim@heists@humane_labs@finale@keycards" ,"ped_b_enter" ,8.0, -8.0, -1, 0, 0, false, false, false)

	-- TELEPORTER --
	local inside = {x = 151.49536, y = -1007.76563, z = -99.85}
	ESX.Game.Teleport(PlayerPedId(), inside)
	SetEntityHeading(GetPlayerPed(-1), 359.817)
	
	-- INSTANCE --
    TriggerEvent('instance:create', 'motell_instance', {motell_instance = locationId, owner = ESX.GetPlayerData().identifier})
	TriggerEvent('instance:onCreate', 'motell_instance')
end

-- CHECK IF OWNED --
function getData(motelId)
    ESX.TriggerServerCallback('andreas_motell:getOwnedRoom', function(data)
		if data then
			enterRoom(motelId)
        else
            ESX.ShowNotification('Du äger inte detta rum')
        end
    end, motelId)
end

function Draw3DText(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())

	local scale = 0.40
 
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		--DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	end
end

function Getmotell_instance(name)
	for i=1, #Config.Doors, 1 do
		if Config.Doors[i].name == name then
			return Config.Doors[i]
		end
	end
end

function motell_instanceIsOwned(motell_instance)
	return OwnedProperties
end

function LeaveInstance()
	if Instance.host ~= nil then

		if #Instance.players > 1 then
			print(' ')
		end

		if RegisteredInstanceTypes[Instance.type].exit ~= nil then
			RegisteredInstanceTypes[Instance.type].exit(Instance)
		end

		TriggerServerEvent('instance:leave', Instance.host)
	end

	InsideInstance = false

end

---------------
--== BLIPS ==--
---------------

local blips = {
	{title="Motellet", colour=7, id=475, x = 325.10467529297, y = -212.86935424805, z = 54.086269378662}
}
	
Citizen.CreateThread(function()

	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.8)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)