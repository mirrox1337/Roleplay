ESX              = nil

local PlayerData = {}
local procentage = false
local timer = false

--====================--
--== CORE THREADING ==--
--====================--
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

--===============--
--== FUNCTIONS ==--
--===============--
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
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	end
end

function procent(time)
	procentage = true
	Left = 0
	repeat
	Left = Left + 1
	Citizen.Wait(time)
	until(Left == 100)
	procentage = false
end

function StartTimer()
	timer = true
	Wait(10000)
	timer = false
end

function loadanim(animation)
	while not HasAnimDictLoaded(animation) do
	  RequestAnimDict(animation)
	  Wait(10)
	end
end

function SearchItems()
	local ped = GetPlayerPed(-1)
	if not timer then
		ESX.TriggerServerCallback('andreas_hambrant:checkMoney', function(hasMoney)
			if hasMoney then

				TriggerServerEvent('andreas_hambrant:checkMoney')
				TaskGoToCoordAnyMeans(ped, 1345.095, 4338.914, 38.10744, 1.0, 0, 0, 786603, 1.0)
				loadanim('mini@repair')
				Wait(11500)
				TaskPlayAnim(GetPlayerPed(-1), "mini@repair", "fixing_a_ped", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
				procent(50)
				ClearPedTasksImmediately(ped)
				TriggerServerEvent('andreas_hambrant:giveItem')
				TriggerServerEvent('andreas_hambrant:giveItem')
				StartTimer()

			else
				exports['mythic_notify']:SendAlert('error', 'Du har inte tillräckligt med pengar')
			end
		end)
	end
end

--=============--
--== THREADS ==--
--=============--
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = GetPlayerPed(-1)
		local pedcoords = GetEntityCoords(ped)
		
		if procentage == true then
      		Draw3DText(pedcoords.x, pedcoords.y, pedcoords.z + 0.5, Left .. '~g~%')
    	end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)

		for k,v in pairs(Config.PickupPoints) do
			if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5) then
				ESX.ShowHelpNotification('~INPUT_PICKUP~ Köp ingredienser (' .. Config.BuyCost .. 'kr)')

				if IsControlJustPressed(0, 38) then
					SearchItems()
				end
			end
		end

		for k,v in pairs(Config.CookSpots) do
			if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5) then
				ESX.ShowHelpNotification('Tryck ~INPUT_PICKUP~ För att koka hembränt')

				if IsControlJustPressed(0, 38) then
					ESX.TriggerServerCallback('andreas_hambrant:checkItems', function(hasItems)
						if hasItems then
							TriggerServerEvent('andreas_hambrant:cook')
							TaskStartScenarioAtPosition(ped, 'PROP_HUMAN_BUM_BIN', 1232.6312255859, 347.5475769043, 81.090814208984, 278.0, 2.0, 1, 0)
							Citizen.Wait(Config.CookTime)
							ClearPedTasksImmediately(ped)
							exports['mythic_notify']:SendAlert('inform', 'Du kokade ihop ingredienserna och fick ' .. Config.RecieveAmount .. 'L hembränt')
						else
							exports['mythic_notify']:SendAlert('error', 'Du har inte ingredienserna som behövs')
						end
					end)
				end
			end
		end
	end
end)