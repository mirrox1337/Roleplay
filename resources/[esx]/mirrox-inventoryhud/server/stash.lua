Citizen.CreateThread(function()
    TriggerEvent('mirrox-inventoryhud:RegisterInventory', {
        name = 'stash',
        label = 'Förråd',
        slots = 100
    })
end)