local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

vehicleWashStation = {
	{26.5906,   -1392.0261, 27.3634},
	{167.1034,  -1719.4704, 27.2916},
	{-74.5693,  6427.8715,  29.4400},
	{-699.6325, -932.7043,  17.0139}
}

-- Add blips
Citizen.CreateThread(function()
	for i = 1, #vehicleWashStation do
		garageCoords = vehicleWashStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 100)
		SetBlipScale  (Blip, 0.65)
		AddTextComponentString("Bil tvätt")
		SetBlipAsShortRange(stationBlip, true)
	end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(2)
		if IsPedSittingInAnyVehicle(PlayerPedId()) then 
			for i = 1, #vehicleWashStation do
				garageCoords = vehicleWashStation[i]
				--DrawMarker(1, garageCoords[1], garageCoords[2], garageCoords[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords[1], garageCoords[2], garageCoords[3], true) < 5 then
					if Config.EnablePrice then
						--ESX.ShowHelpNotification(_U('press_wash_paid', Config.Price))
					else
						--ESX.ShowHelpNotification(_U('press_wash'))
					end
					if IsControlJustPressed(1, 51) then
						WashVehicle()
					end
				end
			end
		else
			-- enter 'sleep mode'
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId(), true)
        for k in pairs(Config.Zones) do
            if GetDistanceBetweenCoords(Config.Zones[k].x, Config.Zones[k].y, Config.Zones[k].z, coords) < 10 then
                Marker("~w~[~p~E~w~] Tvätta bil för ~p~" ..Config.Price.. "kr", 27, Config.Zones[k].x, Config.Zones[k].y, Config.Zones[k].z - 0.99)
            end
        end
    end
end)

function WashVehicle()
	ESX.TriggerServerCallback('esx_carwash:canAfford', function(canAfford)
		if canAfford then
			SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(),  false), 0.0000000001)
			SetVehicleUndriveable(GetVehiclePedIsUsing(PlayerPedId()), false)

			if Config.EnablePrice then
				ESX.ShowNotification(_U('wash_successful_paid', Config.Price))
			else
				ESX.ShowNotification(_U('wash_successful'))
			end
			Citizen.Wait(5000)
		else
			ESX.ShowNotification(_U('wash_failed'))
			Citizen.Wait(5000)
		end
	end)
end
