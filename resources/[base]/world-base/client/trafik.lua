--Multiplier för trafik
Citizen.CreateThread(function()
	while true
			do				
			SetVehicleDensityMultiplierThisFrame(0.1)
			SetRandomVehicleDensityMultiplierThisFrame(0.1)
			SetParkedVehicleDensityMultiplierThisFrame(0.1)
			Citizen.Wait(1)
	end
end)