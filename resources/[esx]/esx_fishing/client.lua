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

Fishing = false
onCircle = false
disableNotify = false

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

local Locations = {

    ["Blips"] = {
        ["FishingLocation"] = {
            ["title"] = "Fiskeplats",
            ["sprite"] = 68,
            ["x"] = -1741.82, ["y"] = -1129.24, ["z"] = 12.17
        },

        ["SellFish"] = {
            ["title"] = "Fiskgrossist",
            ["sprite"] = 356,
            ["x"] =  179.03, ["y"] = 2784.59, ["z"] = 52.92
        }

    },

    ["Markers"] = {
        ["FishingLocation1"] = { ["x"] = -1733.0, ["y"] = -1123.29, ["z"] = 12.05, ["Info"] = "~g~[E] ~g~Fiska" },
        ["FishingLocation2"] = { ["x"] = -1730.11, ["y"] = -1125.75, ["z"] = 12.05, ["Info"] = "~g~[E] ~g~Fiska" },
        ["FishingLocation3"] = { ["x"] = -1727.96, ["y"] = -1127.63, ["z"] = 12.05, ["Info"] = "~g~[E] ~g~Fiska" },
        ["FishingLocation4"] = { ["x"] = -1725.17, ["y"] = -1129.89, ["z"] = 12.05, ["Info"] = "~g~[E] ~g~Fiska" },
        ["SellFish"] = { ["x"] = 180.88, ["y"] = 2793.54, ["z"] = 44.70, ["Info"] = "~g~[E] ~g~Sälj Fiskar" }
    }
}

Citizen.CreateThread(function()

    local Blips = Locations["Blips"]

    for spot, val in pairs(Blips) do
        local BlipInformation = val
        
        local Blip = AddBlipForCoord(BlipInformation["x"], BlipInformation["y"], BlipInformation["z"])
        SetBlipSprite(Blip, BlipInformation["sprite"])
        SetBlipDisplay(Blip, 4)
        SetBlipScale(Blip, 0.65)
        SetBlipColour(Blip, 75)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(BlipInformation["title"])
        EndTextCommandSetBlipName(Blip)
    end

    Citizen.Wait(0)

    while true do
      
        local sleep = 1
        
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        if not Fishing then

            for place, v in pairs(Locations["Markers"]) do

                local dstCheck = GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true)

                if dstCheck <= 5.0 then

                    onCircle = true

                    sleep = 1
                    --DrawM(v["Info"], 27, v["x"], v["y"], v["z"])
                    Marker(v["Info"], 27, v["x"], v["y"], v["z"])
                    if dstCheck <= 1.5 then

                        if IsControlJustPressed(0, Keys["E"]) then
                            print(place)
                            StartAction(place)
                        end
                    
                    else
                        FishOnBait = False
                    end
                end
            end

        end

        Citizen.Wait(sleep)


    end
end) 
  
function StartAction(currentAction)
    if string.len(currentAction) >= 15 then
        StartFishing()
    elseif currentAction == "SellFish" then
        TriggerServerEvent("esx_fishing:sellFish")
    elseif currentAction == "BuyEquipment" then
        OpenFishMenu()
    end
end 




Citizen.CreateThread(function()

    while true do
      
        Citizen.Wait(5)  

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        if Fishing then

            for place, v in pairs(Locations["Markers"]) do

                local dstCheck2 = GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true)

                if dstCheck2 <= 5.5 then
                    if IsControlJustPressed(0, Keys["X"]) then

                    exports['mythic_notify']:PersistentAlert('end', notifyFishEnd)
                    exports['mythic_notify']:PersistentAlert('end', notifyFish)

                    Citizen.Wait(50)

                    exports['mythic_notify']:PersistentAlert('start', notifyFishEndInfo, 'inform', 'Du har slutat att fiska.', { ['background-color'] = '#0d5491' })

                    DeleteEntity(fishingRod)
                    FishOnBait = false
                    onCircle = false
                    disableNotify = true

                    
                    Citizen.Wait(5000)
                    Fishing = false
                    end
                end
            end
        end
    end

end)

function StartFishing()


    Fishing = true
    disableNotify = false

    local FishOnBait = false

    local hasRod, hasBait = GetFishingItems()

    if hasRod and hasBait then

    if disableNotify == false then
        exports['mythic_notify']:PersistentAlert('start', notifyFishEnd, 'inform', 'Tryck [X] för att sluta fiska.', { ['background-color'] = '#0d5491' })
    end

        TriggerServerEvent('esx_fishing:useBait')

        Citizen.CreateThread(function()

            Citizen.Wait(5)
        
            local coords = GetEntityCoords(PlayerPedId())
            local randomTime = math.random(15000, 25000)
            
            while Fishing do
                Citizen.Wait(0)

                if not IsPedActiveInScenario(PlayerPedId()) then
                    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, false)
                    SetEntityHeading(PlayerPedId(), 140.00)

                    Citizen.Wait(randomTime)

                    FishOnBait = true
                end

                if FishOnBait and onCircle then
                    exports['mythic_notify']:PersistentAlert('end', notifyFishEnd)
                    Citizen.Wait(100)
                    if disableNotify == false then
                         exports['mythic_notify']:PersistentAlert('start', notifyFish, 'inform', 'Tryck [E] för att rela in fisken.', { ['background-color'] = '#0d5491' })
                    end

                    if IsControlPressed(0, Keys['E']) then
                        ClearPedTasksImmediately(PlayerPedId())

                        local fishingRod = GetClosestObjectOfType(coords, 10.0, GetHashKey("prop_fishing_rod_01"), false, false, false)

                        if fishingRod ~= 0 and fishingRod ~= nil then

                            TriggerServerEvent('esx_fishing:giveFish')

                            Fishing = false

                            exports['mythic_notify']:PersistentAlert('end', notifyFish)
                            exports['mythic_notify']:PersistentAlert('end', notifyFishEnd)
                            exports['mythic_notify']:PersistentAlert('end', notifyFishEndInfo)
                            Citizen.Wait(0)
                            SetEntityAsMissionEntity(fishingRod, true, true)
                            DeleteEntity(fishingRod)
                            disableNotify = true
                        end
                    end
                end
            end
        end)
    else
        exports['mythic_notify']:SendAlert('inform', 'Du har inte utrusningen för att fiska.', 2500, { ['background-color'] = '#0d5491', ['color'] = '#fff' })
        Citizen.Wait(2500)
        Fishing = false
        return
    end
end

function GetFishingItems()
    local Inventory = ESX.GetPlayerData().inventory

    local hasRod = false
    local hasBait = false

    for i=1, #Inventory, 1 do
        if Inventory[i].name == "fishingrod" then
            if Inventory[i].count > 0 then
                hasRod = true
            end
        end

        if Inventory[i].name == "bait" then
            if Inventory[i].count > 0 then
                hasBait = true
            end
        end
    end
    
    return hasRod, hasBait

end          

function Draw3DText(x, y, z, text)
      local onScreen, _x, _y = World3dToScreen2d(x, y, z)
      local p = GetGameplayCamCoords()
      local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
      local scale = (1 / distance) * 2
      local fov = (1 / GetGameplayCamFov()) * 100
      local scale = scale * fov
      if onScreen then
          SetTextScale(0.0*scale, 0.35*scale)
          SetTextFont(0)
          SetTextProportional(1)
          SetTextColour(255, 255, 255, 255)
          SetTextDropshadow(0, 0, 0, 0, 255)
          SetTextEdge(2, 0, 0, 0, 150) 
          SetTextDropShadow()
          SetTextOutline()
          SetTextEntry("STRING")
          SetTextCentre(1)
          AddTextComponentString(text)
          DrawText(_x,_y)
      end
end