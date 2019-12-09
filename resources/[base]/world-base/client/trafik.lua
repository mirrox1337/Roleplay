--Multiplier f�r trafik
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)		
		SetVehicleDensityMultiplierThisFrame(0.1)
		SetPedDensityMultiplierThisFrame(0.3)
		SetRandomVehicleDensityMultiplierThisFrame(0.0)
		SetNumberOfParkedVehicles(0)
		SetParkedVehicleDensityMultiplierThisFrame(0.0)
		SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1)
		Citizen.Wait(0)
	end
end)