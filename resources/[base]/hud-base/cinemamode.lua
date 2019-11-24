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
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		
		Citizen.Wait(0)
	end
end)

cinema = false
local wasCinema = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			--Ingen hud
			HideHudComponentThisFrame(1)
			HideHudComponentThisFrame(2)
			HideHudComponentThisFrame(3)
			HideHudComponentThisFrame(4)
			HideHudComponentThisFrame(6)
			HideHudComponentThisFrame(7)
			HideHudComponentThisFrame(8)
			HideHudComponentThisFrame(9)
			HideHudComponentThisFrame(13)
			HideHudComponentThisFrame(17)
			HideHudComponentThisFrame(20)

		if cinema then 
			if not wasCinema then
				TriggerEvent('es:setMoneyDisplay', 0.0)
				TriggerEvent('esx_status:setDisplay', 0.0)
				TriggerEvent('streetLabel:hide', true)
				TriggerEvent('esx_voice:hide', true)
				TriggerEvent('revengerp:hide', true)
				TriggerEvent('carhud:hide', true)
				TriggerEvent('essence:hide', true)
				TriggerEvent('speedo:hide', true)
			end

			local screenW, screenH = GetScreenResolution()
			local height = 1080
			local ratio = screenW / screenH
			local width = height * ratio

			DisplayRadar(false)
			
			ESX.UI.HUD.SetDisplay(0.0)

			DrawRect(0.0, 0.0, width / 100, 0.2, 0, 0, 0, 255)
			DrawRect(0.0, 1.0, width / 100, 0.2, 0, 0, 0, 255)

			wasCinema = true
		else
			if wasCinema then
				if IsPedInAnyVehicle(GetPlayerPed(-1)) then
					DisplayRadar(true)
				end
				
				ESX.UI.HUD.SetDisplay(1.0)
				
				TriggerEvent('es:setMoneyDisplay', 1.0)
				TriggerEvent('esx_status:setDisplay', 1.0)
				TriggerEvent('streetLabel:hide', false)
				TriggerEvent('esx_voice:hide', false)
				TriggerEvent('revengerp:hide', false)
				TriggerEvent('carhud:hide', false)
				TriggerEvent('essence:hide', false)
				TriggerEvent('speedo:hide', false)

				wasCinema = false
			end
		end
	end
end)

RegisterNetEvent('revenge-cinemamode:show')
AddEventHandler('revenge-cinemamode:show', function()
	cinema = not cinema
end)


RegisterNetEvent('revenge-cinemamode:force')
AddEventHandler('revenge-cinemamode:force', function(forced)
	cinema = forced
end)