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
			Text("~b~X~w~: " ..roundx.." ~b~Y~w~: " ..roundy.." ~b~Z~w~: " ..roundz.." ~b~H~w~: " ..roundh.."")
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