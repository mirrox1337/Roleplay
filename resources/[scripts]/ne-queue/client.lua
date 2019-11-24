local connected = false

AddEventHandler("playerSpawned", function()
	if not connected then
		TriggerServerEvent("ne-queue:playerConnected")
		connected = true
	end
end)