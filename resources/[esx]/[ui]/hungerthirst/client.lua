ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
        	ESX = obj
        end)

        Citizen.Wait(0)
    end
end)
--Base HUD
Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(10)
	end

	if ESX.IsPlayerLoaded() then
		loaded = true
	end

	while not loaded do
		Citizen.Wait(500)
	end

	DisplayRadar(false)

	while true do
		Citizen.Wait(0)

		local inVehicle = IsPedInAnyVehicle(GetPlayerPed(-1), -1)

		if inVehicle and not radar then
			DisplayRadar(true)

			radar = true
		elseif not inVehicle and radar then
			radar = false

			DisplayRadar(false)
		end
	end
end)

--Ingen HUD
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

    	HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(14)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(20)
  end
end)


--Hunger/Thirst
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if IsPauseMenuActive() and not IsPaused then
	  IsPaused = true
    SendNUIMessage({action = "toggle", show = false})
    elseif not IsPauseMenuActive() and IsPaused then
    IsPaused = false
    SendNUIMessage({action = "toggle", show = true})
    end
  end
end)

AddEventHandler('ui:updateStatus', function(status)
  SendNUIMessage({action = "updateStatus", status = status})
end)