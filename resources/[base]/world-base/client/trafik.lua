--Multiplier f�r trafik
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)		
		SetVehicleDensityMultiplierThisFrame(0.1)
		SetPedDensityMultiplierThisFrame(0.3)
		SetRandomVehicleDensityMultiplierThisFrame(0.2)
		SetParkedVehicleDensityMultiplierThisFrame(0.0)
		SetScenarioPedDensityMultiplierThisFrame(0.2, 0.2)
		Citizen.Wait(10)
	end
end)