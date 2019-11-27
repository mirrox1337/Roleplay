Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'stash',
        label = 'Förråd',
        slots = 100
    })
end)