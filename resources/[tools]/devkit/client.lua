-- Teleport to marker
local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)


RegisterCommand("tpm", function(source)
    TeleportToWaypoint()
end)

TeleportToWaypoint = function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end

                ESX.ShowNotification("Teleporterad.")
            else
                ESX.ShowNotification("Placera en GPS puck.")
            end
        else
            ESX.ShowNotification("Du har inga rättigheter för att utföra detta.")
        end
    end)
end

-- Coords
function Text(text)
		SetTextColour(186, 186, 186, 255)
		SetTextFont(6)
		SetTextScale(0.378, 0.378)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(0.020, 0.820)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if showcoord then
	    	x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			heading = GetEntityHeading(GetPlayerPed(-1))
	    	roundx = tonumber(string.format("%.2f", x))
	    	roundy = tonumber(string.format("%.2f", y))
	    	roundz = tonumber(string.format("%.2f", z))
			roundh = tonumber(string.format("%.2f", heading))
			Text("~p~X~w~: " ..roundx.." ~p~Y~w~: " ..roundy.." ~p~Z~w~: " ..roundz.." ~p~H~w~: " ..roundh.."")
		end
		
	end
end)

function coords()
	if showcoord then
		showcoord = false
	else
		showcoord = true
	end
end

RegisterCommand("coords", function(source)
    coords()
end, false)