--Multiplier f�r trafik
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)		
		SetVehicleDensityMultiplierThisFrame(0.01)
		SetPedDensityMultiplierThisFrame(0.3)
		SetRandomVehicleDensityMultiplierThisFrame(0.0)
		SetNumberOfParkedVehicles(0)
		SetParkedVehicleDensityMultiplierThisFrame(0.0)
		SetScenarioPedDensityMultiplierThisFrame(0.01, 0.01)
		Citizen.Wait(1000)
	end
end)