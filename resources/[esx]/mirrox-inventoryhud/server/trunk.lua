Citizen.CreateThread(function()
    --Player
    TriggerEvent('mirrox-inventoryhud:RegisterInventory', {
        name = 'trunk',
        label = 'Bagageutrymmet',
        slots = 20,
        getInventory = function(identifier, cb)
            getInventory(identifier, 'trunk', cb)
        end,
        saveInventory = function(identifier, inventory)
            if table.length(inventory) > 0 then
                saveInventory(identifier, 'trunk', inventory)
            else
                deleteInventory(identifier, 'trunk')
            end
        end,
        getDisplayInventory = function(identifier, cb, source)
            getDisplayInventory(identifier, 'trunk', cb, source)
        end
    })
end)