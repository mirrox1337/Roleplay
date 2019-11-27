local drops = {}

Citizen.CreateThread(function()
    --Player
    TriggerEvent('mirrox-inventoryhud:RegisterInventory', {
        name = 'drop',
        label = 'Marken',
        slots = 10
    })
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
    MySQL.Async.fetchAll('SELECT * FROM mirrox_inventory WHERE type = \'drop\'', {}, function(results)
        for k, v in pairs(results) do
            drops[v.owner] = json.decode(v.data)
        end
        TriggerClientEvent('mirrox-inventoryhud:updateDrops', -1, drops)
    end)
end)

RegisterServerEvent('disc-inventoryhud:modifiedInventory')
AddEventHandler('disc-inventoryhud:modifiedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('disc-inventoryhud:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('mirrox-inventoryhud:savedInventory')
AddEventHandler('mirrox-inventoryhud:savedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('mirrox-inventoryhud:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('mirrox-inventoryhud:createdInventory')
AddEventHandler('mirrox-inventoryhud:createdInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('mirrox-inventoryhud:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('mirrox-inventoryhud:deletedInventory')
AddEventHandler('mirrox-inventoryhud:deletedInventory', function(identifier, type)
    if type == 'drop' then
        drops[identifier] = nil
        TriggerClientEvent('mirrox-inventoryhud:updateDrops', -1, drops)
    end
end)

