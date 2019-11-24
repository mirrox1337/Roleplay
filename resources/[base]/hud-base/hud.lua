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

local radar = false
local loaded = false

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

		if not cinema then
			DrawOutline()
			DrawHealth()
			DrawArmor()

			if inVehicle then
				DrawVehicleHud()
			end
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	loaded = true
end)

function DrawVehicleHud()
    local speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6)

    DrawObject(0.015, 0.775, 0.141, 0.03, 30, 30, 30)
    DrawTextWithFont("~b~" .. speed, 0.02, 0.7725, 0.5, 255, 255, 255)
    DrawTextWithFont("KM/H", 0.0375, 0.78, 0.35, 255, 255, 255)
end

function DrawOutline()
	local padding = 0.005

	DrawObject(0.0149 - (padding / 4.25), 0.971 - (padding / 2), 0.142 + (padding / 2), 0.023 + padding, 30, 30, 30)
end

function DrawHealth()
	local ped = GetPlayerPed(-1)

	DrawObject(0.015, 0.971, 0.07, 0.0085, 150, 150, 150)
	DrawObject(0.015, 0.971, (0.07 / GetEntityMaxHealth(ped)) * GetEntityHealth(ped), 0.0085, 115, 229, 73)
end

function DrawArmor()
	local ped = GetPlayerPed(-1)

	DrawObject(0.086, 0.971, 0.07, 0.0095, 150, 150, 150)
	DrawObject(0.086, 0.971, (0.07 / 100.0) * GetPedArmour(ped), 0.0090, 24, 110, 259)
end

function DrawObject(x, y, width, height, red, green, blue)
	DrawRect(x + (width / 2.0), y + (height / 2.0), width, height, red, green, blue, 150)
end

function DrawTextWithFont(text, x, y, scale, red, green, blue)
	SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(red, green, blue, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")

    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3D(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 370

	DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end
