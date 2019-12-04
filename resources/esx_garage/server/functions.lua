UpdateGarage = function(vehicleProps, newGarage, fuel)
	local sqlQuery = [[
		UPDATE
			owned_vehicles
		SET
			garage = @garage, vehicle = @newVehicle, fuel = @fuel
		WHERE
			plate = @plate
	]]

	MySQL.Async.execute(sqlQuery, {
		["@plate"] = vehicleProps["plate"],
		["@garage"] = newGarage,
		["@newVehicle"] = json.encode(vehicleProps),
		["@fuel"] = fuel
	}, function(rowsChanged)
		if rowsChanged > 0 then
			
		end
	end)
end