--Multiplier f�r trafik
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)		
			SetVehicleDensityMultiplierThisFrame(0.05)
			SetRandomVehicleDensityMultiplierThisFrame(0.1)
			SetParkedVehicleDensityMultiplierThisFrame(0.001)
			Citizen.Wait(1)
	end
end)