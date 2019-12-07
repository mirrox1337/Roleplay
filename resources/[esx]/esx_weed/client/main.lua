local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
        PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx_weed:onSmoke')
AddEventHandler('esx_weed:onSmoke', function()
    RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(600000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)


RegisterNetEvent('esx_weed:plant')
AddEventHandler('esx_weed:plant', function(x,y,z)
    RequestModel("bkr_prop_weed_01_small_01a")
    while not HasModelLoaded("bkr_prop_weed_01_small_01a") do
        Wait(1)
    end
    Wait(100)
    CreateObject(GetHashKey('bkr_prop_weed_01_small_01a'), x, y, z - 0.96, true, true, true)
end)

RegisterNetEvent('esx_weed:roll')
AddEventHandler('esx_weed:roll', function()
    RequestAnimDict("mp_weapons_deal_sting")

    Wait(10)

    while not HasAnimDictLoaded("mp_weapons_deal_sting") do
       Wait(1)
    end

    Wait(10)

    TaskPlayAnim(GetPlayerPed(-1), "mp_weapons_deal_sting", "crackhead_bag_loop", 1.0, -1.0, 5000, 0, 1, true, true, true) -- animation
    Citizen.Wait(5500)
    --ESX.ShowNotification('Du rullade ihop 5 ~g~jointar')
    exports['mythic_notify']:SendAlert('inform', ('Du rullade ihop 5 jointar'))
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)

function spawnObject(x, y ,z)
    RequestModel("bkr_prop_weed_01_small_01a")
    while not HasModelLoaded("bkr_prop_weed_01_small_01a") do
        Wait(1)
    end
    Wait(1000)
    DrugPlant = CreateObject(GetHashKey('bkr_prop_weed_01_small_01a'), x, y, z - 0.96, false, true, true)
end

RegisterNetEvent('esx_weed:waterCL')
AddEventHandler('esx_weed:waterCL', function()
    TaskStartScenarioInPlace(GetPlayerPed(-1), 'WORLD_HUMAN_BUM_WASH')
    Citizen.Wait(5500) -- watering items
    ClearPedTasksImmediately(GetPlayerPed(-1))
    Wait(10)
end)

RegisterNetEvent('esx_weed:takeCL')
AddEventHandler('esx_weed:takeCL', function()
    TaskStartScenarioInPlace(GetPlayerPed(-1), 'world_human_gardener_plant')
    Citizen.Wait(8500) -- destroying time
    local coords = GetEntityCoords(GetPlayerPed(-1))
    plant = GetClosestObjectOfType( coords.x, coords.y,  coords.z, 3.0, GetHashKey('bkr_prop_weed_01_small_01a'), 0, 0, 0)
    Wait(10)
    DeleteObject(plant)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)

RegisterNetEvent('esx_weed:removeObjects')
AddEventHandler('esx_weed:removeObjects', function(x, y, z)
	plant = GetClosestObjectOfType(x, y, z, 3.0, GetHashKey('bkr_prop_weed_01_small_01a'), 0, 0, 0)
	DeleteObject(plant)
end)

function openWeedMenu(x, y, z, spot)
    ESX.UI.Menu.CloseAll()

    local elements = {}


    table.insert(elements, {label = 'Plantera Planta', value = 'plant'})
    table.insert(elements, {label = 'Vattna Planta', value = 'water'})
    table.insert(elements, {label = 'Skörda Planta', value = 'take'})
    table.insert(elements, {label = 'Förstör Planta', value = 'destroy'})

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'drug_first',
        {
            title    = 'Drogmeny',
            align    = 'top-right',
            elements = elements,
        },
    function (data, menu)
        local action = data.current.value
        if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            if action == 'plant' then

                RequestAnimDict("anim@apt_trans@garage")
                while not HasAnimDictLoaded("anim@apt_trans@garage") do
                   Wait(1)
                end
                TaskPlayAnim(GetPlayerPed(-1), "anim@apt_trans@garage", "gar_open_1_left", 1.0, -1.0, 5000, 0, 1, true, true, true) -- animation
               
                Citizen.Wait(3500)

                Wait(10)
                TriggerServerEvent('esx_weed:add', spot, x, y, z, 15)
                ESX.UI.Menu.CloseAll()
            end

            if action == 'water' then
                TriggerServerEvent('esx_weed:water', spot)
                ESX.UI.Menu.CloseAll()
                Wait(2500)
            end

            if action == 'take' then
                TriggerServerEvent('esx_weed:take', spot)
                ESX.UI.Menu.CloseAll()
            end

            if action == 'destroy' then
            	TriggerServerEvent('esx_weed:destroy', spot)
            	ESX.UI.Menu.CloseAll()
            end
        else
            --ESX.ShowNotification('Du kan ~r~ej~s~ göra det i ett fordon')
            exports['mythic_notify']:SendAlert('error', ('Du kan ej göra det i ett fordon'))
        end

    end,
    function (data, menu)
        ESX.UI.Menu.CloseAll()
    end
    )
end

Citizen.CreateThread(function()
    while true do
        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.DrugLocations) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
                DrawMarker(Config.Type, v.x, v.y, v.z - 0.96, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5)then
                Draw3DText(v.x, v.y, v.z+0.3, '~w~Tryck [~r~E~w~] för att hantera cannabis')
                if IsControlJustReleased(0, Keys['E']) then
                    openWeedMenu(v.x, v.y, v.z, v.n)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(7500)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.DrugLocations) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 5.0)then
                plant = GetClosestObjectOfType( coords.x, coords.y,  coords.z, 5.0, GetHashKey('prop_weed_01'), 0, 0, 0)
                if plant == 0 then
                    Wait(100)
                    ESX.TriggerServerCallback('esx_weed:getDrugs', function(plants)
                        Wait(100)
                        for i=1, #plants, 1 do
                            Wait(10)
                            if v.n == plants[i].number then
                                spawnObject(v.x, v.y, v.z)
                            end
                        end
                    end)
                end
            end
        end
    end
end)

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "blackmamba",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end

function Draw3DText(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.35
   
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
		
		local factor = (string.len(text)) / 400
		DrawRect(_x, _y + 0.012, 0.005 + factor, 0.03, 11, 11, 11, 155)

	end
end