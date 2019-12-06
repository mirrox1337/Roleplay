ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	ScriptLoaded()
end)

function ScriptLoaded()
	LoadLocations()
end

Grinding = false

local Locations = {
    ["Grinda"] = {
        ["x"] = 1958.04,
        ["y"] = 5181.37,
        ["z"] = 47.98
    },

    ["Mixa"] = {
        ["x"] = 1943.79,
        ["y"] = 5177.96,
        ["z"] = 47.98
    },

    ["Väga och Paketera"] = {
        ["x"] = 1951.26,
        ["y"] = 5179.02,
        ["z"] = 47.98
    }
}


function LoadLocations()

	Citizen.CreateThread(function()

		while true do

			local sleepThread = 500

			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			for locationId, v in pairs(Locations) do
				local distanceCheck = GetDistanceBetweenCoords(pedCoords, v["x"], v["y"], v["z"], true)
    				if distanceCheck <= 2.0 and Grinding == false then
    					sleepThread = 5

                        if Grinding ~= true then
        					ESX.Game.Utils.DrawText3D(v, "Tryck ~g~E~s~ för att " .. locationId, 0.7)

        					if distanceCheck <= 2.0 then
                                if IsControlJustPressed(0, 38) then
        							DoAction(locationId)
        						end
        					end	
                        end				
    				end
			end
			Citizen.Wait(sleepThread)
        end
	end)
end

function DoAction(action)
	    if action == "Grinda" then
    
        ESX.TriggerServerCallback("esx_cocaine:checkGrind", function(isValid)
            if isValid then
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                Citizen.CreateThread(function()
                    local timeStarted = GetGameTimer()
                    Grinding = true
                    while Grinding do

                        Citizen.Wait(5)
                    
                        local percent = (GetGameTimer() - timeStarted) / 300000 * 1000
                        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                        FreezeEntityPosition(PlayerPedId(), true)
        
                        ESX.Game.Utils.DrawText3D({ x = x, y = y, z = z + 0.7 }, "~g~Grindar~w~: " .. math.ceil(percent) .. "%", 1.0)

                        if percent <= 100 then
                            Grinding = true
                        end

                        if percent >= 100 then
                            TriggerServerEvent("esx_cocaine:grind")
                            Grinding = false
                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                            ClearPedTasksImmediately(PlayerPedId())
                        end
                    end
                end)
            else
                --ESX.ShowNotification('Du saknar något..')
                exports['mythic_notify']:SendAlert('error', ('Du saknar något..'))
            end
        end)
    end	

    if action == "Mixa" then
    
        ESX.TriggerServerCallback("esx_cocaine:checkIngredients", function(isValid)
            if isValid then
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                Citizen.CreateThread(function()
                    local timeStarted = GetGameTimer()
                    Grinding = true
                    while Grinding do
        
                        Citizen.Wait(5)
        
                        local percent = (GetGameTimer() - timeStarted) / 300000 * 500
                        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                        FreezeEntityPosition(PlayerPedId(), true)
        
                        ESX.Game.Utils.DrawText3D({ x = x, y = y, z = z + 0.7 }, "~g~Mixar~w~: " .. math.ceil(percent) .. "%", 1.0)
        
                        if percent <= 100 then
                            Grinding = true
                        end

                        if percent >= 100 then
                            TriggerServerEvent("esx_cocaine:mix")
                            Grinding = false
                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                            ClearPedTasksImmediately(PlayerPedId())
                        end
                    end
                end)
            else
                --ESX.ShowNotification('Du saknar något..')
                exports['mythic_notify']:SendAlert('error', ('Du saknar något..'))
            end
        end)
    end

	    if action == "Väga och Paketera" then
    
        ESX.TriggerServerCallback("esx_cocaine:checkPack", function(isValid)
            if isValid then
                TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                Citizen.CreateThread(function()
                    local timeStarted = GetGameTimer()
                    Grinding = true
                    while Grinding do
            
                        Citizen.Wait(5)
        
                        local percent = (GetGameTimer() - timeStarted) / 300000 * 2000
                        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                        FreezeEntityPosition(PlayerPedId(), true)
        
                        ESX.Game.Utils.DrawText3D({ x = x, y = y, z = z + 0.7 }, "~g~Väger och paketerar~w~: " .. math.ceil(percent) .. "%", 1.0)
        
                        if percent <= 100 then
                            Grinding = true
                        end

                        if percent >= 100 then
                            TriggerServerEvent("esx_cocaine:pack")
                            Grinding = false
                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                            ClearPedTasksImmediately(PlayerPedId())
                        end
                    end
                end)
            else
                --ESX.ShowNotification('Du saknar något..')
                exports['mythic_notify']:SendAlert('error', ('Du saknar något..'))
            end
        end)
    end	
end

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "cocaine",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end
