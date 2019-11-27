local openInventory = {}
loadedInventories = {}

RegisterServerEvent('mirrox-inventoryhud:openInventory')
AddEventHandler('mirrox-inventoryhud:openInventory', function(inventory)
    if openInventory[inventory.owner] == nil then
        openInventory[inventory.owner] = {}
    end
    openInventory[inventory.owner][source] = true
end)

RegisterServerEvent('mirrox-inventoryhud:closeInventory')
AddEventHandler('mirrox-inventoryhud:closeInventory', function(inventory)
    if openInventory[inventory.owner] == nil then
        openInventory[inventory.owner] = {}
    end
    if openInventory[inventory.owner][source] then
        openInventory[inventory.owner][source] = nil
    end
end)

RegisterServerEvent('mirrox-inventoryhud:refreshInventory')
AddEventHandler('mirrox-inventoryhud:refreshInventory', function(owner)
    if openInventory[owner] == nil then
        openInventory[owner] = {}
    end

    for k, v in pairs(openInventory[owner]) do
        TriggerClientEvent('mirrox-inventoryhud:refreshInventory', k)
    end
end)

function dumpInventory(inventory)
    for k, v in pairs(inventory) do
        print(k .. ' ' .. v.name)
    end
end

RegisterServerEvent("mirrox-inventoryhud:MoveToEmpty")
AddEventHandler("mirrox-inventoryhud:MoveToEmpty", function(data)
    local source = source
    handleWeaponRemoval(data, source)
    if data.originOwner == data.destinationOwner and data.originTier.name == data.destinationTier.name then
        local originInvHandler = InvType[data.originTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(inventory)
            inventory[tostring(data.destinationSlot)] = inventory[tostring(data.originSlot)]
            inventory[tostring(data.originSlot)] = nil
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        end)
    else
        local originInvHandler = InvType[data.originTier.name]
        local destinationInvHandler = InvType[data.destinationTier.name]
        if data.originTier.name == 'shop' then
            local player = ESX.GetPlayerFromIdentifier(data.destinationOwner)
            if player.getMoney() >= data.originItem.price * data.originItem.qty then
                player.removeMoney(data.originItem.price * data.originItem.qty)
            else
                return
            end
        end

        if data.destinationTier.name == 'shop' then
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.destinationOwner)
            print('Attempt to sell')
            return
        end

        originInvHandler.applyToInventory(data.originOwner, function(originInventory)
            destinationInvHandler.applyToInventory(data.destinationOwner, function(destinationInventory)
                destinationInventory[tostring(data.destinationSlot)] = originInventory[tostring(data.originSlot)]
                originInventory[tostring(data.originSlot)] = nil

                if data.originTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.originItem, data.originItem.qty, source)
                    Citizen.Wait(1000)
                    ESX.GetPlayerFromIdentifier(data.originOwner).removeInventoryItem(data.originItem.id, data.originItem.qty)
                end

                if data.destinationTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingAddition', data.originItem, data.originItem.qty, source)
                    Citizen.Wait(1000)
                    ESX.GetPlayerFromIdentifier(data.destinationOwner).addInventoryItem(data.originItem.id, data.originItem.qty)
                end

            end)
        end)
    end
end)

RegisterServerEvent("mirrox-inventoryhud:SwapItems")
AddEventHandler("mirrox-inventoryhud:SwapItems", function(data)
    local source = source

    handleWeaponRemoval(data, source)
    if data.originTier.name == 'shop' then
        print('Attempt to Swap in Store')
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.destinationOwner)
        return
    end

    if data.destinationTier.name == 'shop' then
        print('Attempt to Swap in Store')
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.destinationOwner)
        return
    end

    if data.originOwner == data.destinationOwner and data.originTier.name == data.destinationTier.name then
        local originInvHandler = InvType[data.originTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(inventory)
            local tempItem = inventory[tostring(data.originSlot)]
            inventory[tostring(data.originSlot)] = inventory[tostring(data.destinationSlot)]
            inventory[tostring(data.destinationSlot)] = tempItem
            originInvHandler.saveInventory(data.originOwner, inventory)
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        end)
    else
        local originInvHandler = InvType[data.originTier.name]
        local destinationInvHandler = InvType[data.destinationTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(originInventory)
            destinationInvHandler.applyToInventory(data.destinationOwner, function(destinationInventory)
                local tempItem = originInventory[tostring(data.originSlot)]
                originInventory[tostring(data.originSlot)] = destinationInventory[tostring(data.destinationSlot)]
                destinationInventory[tostring(data.destinationSlot)] = tempItem

                if data.originTier.name == 'player' then
                    data.originItem.block = true
                    data.destinationItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingAddition', data.originItem, data.originItem.qty, source)
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.destinationItem, data.destinationItem.qty, source)
                    ESX.GetPlayerFromIdentifier(data.originOwner).addInventoryItem(data.originItem.id, data.originItem.qty)
                    ESX.GetPlayerFromIdentifier(data.originOwner).removeInventoryItem(data.destinationItem.id, data.destinationItem.qty)
                end

                if data.destinationTier.name == 'player' then
                    data.originItem.block = true
                    data.destinationItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.originItem, data.originItem.qty, source)
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingAddition', data.destinationItem, data.destinationItem.qty, source)
                    ESX.GetPlayerFromIdentifier(data.destinationOwner).removeInventoryItem(data.originItem.id, data.originItem.qty)
                    ESX.GetPlayerFromIdentifier(data.destinationOwner).addInventoryItem(data.destinationItem.id, data.destinationItem.qty)
                end

            end)
        end)
    end
end)

RegisterServerEvent("mirrox-inventoryhud:CombineStack")
AddEventHandler("mirrox-inventoryhud:CombineStack", function(data)
    local source = source

    handleWeaponRemoval(data, source)
    if data.originTier.name == 'shop' then
        local player = ESX.GetPlayerFromIdentifier(data.destinationOwner)
        if player.getMoney() >= data.originItem.price * data.originQty then
            player.removeMoney(data.originItem.price * data.originQty)
        else
            return
        end
    end

    if data.destinationTier.name == 'shop' then
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.destinationOwner)
        print('Attempt to sell')
        return
    end

    if data.originOwner == data.destinationOwner and data.originTier.name == data.destinationTier.name then
        local originInvHandler = InvType[data.originTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(inventory)
            inventory[tostring(data.originSlot)] = nil
            inventory[tostring(data.destinationSlot)].count = data.destinationQty
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        end)
    else
        local originInvHandler = InvType[data.originTier.name]
        local destinationInvHandler = InvType[data.destinationTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(originInventory)
            destinationInvHandler.applyToInventory(data.destinationOwner, function(destinationInventory)
                originInventory[tostring(data.originSlot)] = nil
                destinationInventory[tostring(data.destinationSlot)].count = data.destinationQty


                if data.originTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.originItem, data.originItem.qty, source)
                    ESX.GetPlayerFromIdentifier(data.originOwner).removeInventoryItem(data.originItem.id, data.originItem.qty)
                end

                if data.destinationTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingAddition', data.originItem, data.originItem.qty, source)
                    ESX.GetPlayerFromIdentifier(data.destinationOwner).addInventoryItem(data.originItem.id, data.originItem.qty)
                end
            end)
        end)
    end
end)

RegisterServerEvent("mirrox-inventoryhud:EmptySplitStack")
AddEventHandler("mirrox-inventoryhud:EmptySplitStack", function(data)

    handleWeaponRemoval(data, source)
    if data.originTier.name == 'shop' then
        local player = ESX.GetPlayerFromIdentifier(data.destinationOwner)
        if player.getMoney() >= data.originItem.price * data.moveQty then
            player.removeMoney(data.originItem.price * data.moveQty)
        else
            return
        end
    end

    if data.destinationTier.name == 'shop' then
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.destinationOwner)
        print('Attempt to sell')
        return
    end

    local source = source
    if data.originOwner == data.destinationOwner and data.originTier.name == data.destinationTier.name then
        local originInvHandler = InvType[data.originTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(inventory)
            inventory[tostring(data.originSlot)].count = inventory[tostring(data.originSlot)].count - data.moveQty
            local item = inventory[tostring(data.originSlot)]
            inventory[tostring(data.destinationSlot)] = {
                name = item.name,
                count = data.moveQty
            }
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        end)
    else
        local originInvHandler = InvType[data.originTier.name]
        local destinationInvHandler = InvType[data.destinationTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(originInventory)
            destinationInvHandler.applyToInventory(data.destinationOwner, function(destinationInventory)
                originInventory[tostring(data.originSlot)].count = originInventory[tostring(data.originSlot)].count - data.moveQty
                local item = originInventory[tostring(data.originSlot)]
                destinationInventory[tostring(data.destinationSlot)] = {
                    name = item.name,
                    count = data.moveQty
                }

                if data.originTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.originItem, data.moveQty, source)
                    ESX.GetPlayerFromIdentifier(data.originOwner).removeInventoryItem(data.originItem.id, data.moveQty)
                end

                if data.destinationTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingAddition', data.originItem, data.moveQty, source)
                    ESX.GetPlayerFromIdentifier(data.destinationOwner).addInventoryItem(data.originItem.id, data.moveQty)
                end
            end)
        end)
    end
end)

RegisterServerEvent("mirrox-inventoryhud:SplitStack")
AddEventHandler("mirrox-inventoryhud:SplitStack", function(data)
    local source = source
    handleWeaponRemoval(data, source)

    if data.originTier.name == 'shop' then
        local player = ESX.GetPlayerFromIdentifier(data.destinationOwner)
        if player.getMoney() >= data.originItem.price * data.moveQty then
            player.removeMoney(data.originItem.price * data.moveQty)
        else
            return
        end
    end

    if data.destinationTier.name == 'shop' then
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        TriggerEvent('mirrox-inventoryhud:refreshInventory', data.destinationOwner)
        print('Attempt to sell')
        return
    end

    if data.originOwner == data.destinationOwner and data.originTier.name == data.destinationTier.name then
        local originInvHandler = InvType[data.originTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(inventory)
            inventory[tostring(data.originSlot)].count = inventory[tostring(data.originSlot)].count - data.moveQty
            inventory[tostring(data.destinationSlot)].count = inventory[tostring(data.destinationSlot)].count + data.moveQty
            TriggerEvent('mirrox-inventoryhud:refreshInventory', data.originOwner)
        end)
    else
        local originInvHandler = InvType[data.originTier.name]
        local destinationInvHandler = InvType[data.destinationTier.name]
        originInvHandler.applyToInventory(data.originOwner, function(originInventory)
            destinationInvHandler.applyToInventory(data.destinationOwner, function(destinationInventory)
                originInventory[tostring(data.originSlot)].count = originInventory[tostring(data.originSlot)].count - data.moveQty
                destinationInventory[tostring(data.destinationSlot)].count = destinationInventory[tostring(data.destinationSlot)].count + data.moveQty

                if data.originTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.originItem, data.moveQty, source)
                    ESX.GetPlayerFromIdentifier(data.originOwner).removeInventoryItem(data.originItem.id, data.moveQty)
                end

                if data.destinationTier.name == 'player' then
                    data.originItem.block = true
                    TriggerEvent('mirrox-inventoryhud:notifyImpendingAddition', data.originItem, data.moveQty, source)
                    ESX.GetPlayerFromIdentifier(data.destinationOwner).addInventoryItem(data.originItem.id, data.moveQty)
                end
            end)
        end)
    end
end)

RegisterServerEvent("mirrox-inventoryhud:GiveItem")
AddEventHandler("mirrox-inventoryhud:GiveItem", function(data)
    handleWeaponRemoval(data, source)
    local targetPlayer = ESX.GetPlayerFromId(data.target)
    targetPlayer.addInventoryItem(data.item.id, data.count)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    sourcePlayer.removeInventoryItem(data.item.id, data.count)
    TriggerClientEvent('mirrox-inventoryhud:refreshInventory', source)
    TriggerClientEvent('mirrox-inventoryhud:refreshInventory', data.target)
end)

RegisterServerEvent("mirrox-inventoryhud:GiveCash")
AddEventHandler("mirrox-inventoryhud:GiveCash", function(data)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    if sourcePlayer.getMoney() >= data.count then
        sourcePlayer.removeMoney(data.count)
        local targetPlayer = ESX.GetPlayerFromId(data.target)
        targetPlayer.addMoney(data.count)
        TriggerClientEvent('mirrox-inventoryhud:refreshInventory', source)
        TriggerClientEvent('mirrox-inventoryhud:refreshInventory', data.target)
    end
end)

function debugData(data)
    for k, v in pairs(data) do
        print(k .. ' ' .. v)
    end
end

function removeItemFromSlot(inventory, slot, count)
    if inventory[tostring(slot)].count - count > 0 then
        inventory[tostring(slot)].count = inventory[tostring(slot)].count - count
        return
    else
        inventory[tostring(slot)] = nil
        return
    end
end

function removeItemFromInventory(item, count, inventory)
    for k, v in pairs(inventory) do
        if v.name == item.name then
            if v.count - count < 0 then
                local tempCount = inventory[k].count
                inventory[k] = nil
                count = count - tempCount
            elseif v.count - count > 0 then
                inventory[k].count = inventory[k].count - count
                return
            elseif v.count - count == 0 then
                inventory[k] = nil
                return
            else
                print('Missing Remove condition')
            end
        end
    end
end

function addToInventory(item, type, inventory, max)
    if max == -1 then
        max = 9999
    end
    local toAdd = item.count
    while toAdd > 0 do
        toAdd = AttemptMerge(item, inventory, toAdd, max)
        if toAdd > 0 then
            toAdd = AddToEmpty(item, type, inventory, toAdd, max)
        else
            toAdd = 0
        end
    end
end

function AttemptMerge(item, inventory, count, max)
    for k, v in pairs(inventory) do
        if v.name == item.name then
            if v.count + count > max then
                local tempCount = max - inventory[k].count
                inventory[tostring(k)].count = max
                count = count - tempCount
            elseif v.count + count <= max then
                inventory[tostring(k)].count = v.count + count
                return 0
            else
                print('Missing MERGE condition')
            end
        end
    end
    return count
end

function AddToEmpty(item, type, inventory, count, max)
    for i = 1, InvType[type].slots, 1 do
        if inventory[tostring(i)] == nil then
            if count > max then
                inventory[tostring(i)] = item
                inventory[tostring(i)].count = max
                return count - max
            else
                inventory[tostring(i)] = item
                return 0
            end
        end
    end
    print('Inventory Overflow!')
    return 0
end

function createDisplayItem(item, esxItem, slot, price, type)
    local max = esxItem.limit
    if max == -1 then
        max = 9999
    end
    return {
        id = esxItem.name,
        itemId = esxItem.name,
        qty = item.count,
        slot = slot,
        label = esxItem.label,
        type = type or 'item',
        max = max,
        stackable = true,
        unique = esxItem.rare,
        usable = esxItem.usable,
        description = getItemDataProperty(esxItem.name, 'Beskrivning'),
        weight = getItemDataProperty(esxItem.name, 'Vikt'),
        metadata = {},
        staticMeta = {},
        canRemove = esxItem.canRemove,
        price = price or 0,
        needs = false,
        closeUi = getItemDataProperty(esxItem.name, 'closeonuse'),
    }
end

function createItem(name, count)
    return { name = name, count = count }
end

ESX.RegisterServerCallback('mirrox-inventoryhud:getSecondaryInventory', function(source, cb, type, identifier)
    InvType[type].getDisplayInventory(identifier, cb, source)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5 * 60 * 1000)
        saveInventories()
    end
end)

function saveInventories()
    for type, inventories in pairs(loadedInventories) do
        for identifier, inventory in pairs(inventories) do
            if table.length(inventory) > 0 then
                saveLoadedInventory(identifier, type, inventory)
            else
                deleteInventory(identifier, type)
            end
        end
    end
    RconPrint('[Disc-InventoryHud][SAVED] All Inventories' .. "\n")
end

function saveInventory(identifier, type)
    saveLoadedInventory(identifier, type, loadedInventories[type][identifier])
end

function saveLoadedInventory(identifier, type, data)
    MySQL.Async.execute('UPDATE mirrox_inventory SET data = @data WHERE owner = @owner AND type = @type', {
        ['@owner'] = identifier,
        ['@type'] = type,
        ['@data'] = json.encode(data)
    }, function(result)
        if result == 0 then
            createInventory(identifier, type, data)
        end
        loadedInventories[type][identifier] = nil
        TriggerEvent('mirrox-inventoryhud:savedInventory', identifier, type, data)
    end)
end

function createInventory(identifier, type, data)
    MySQL.Async.execute('INSERT INTO mirrox_inventory (owner, type, data) VALUES (@owner, @type, @data)', {
        ['@owner'] = identifier,
        ['@type'] = type,
        ['@data'] = json.encode(data)
    }, function()
        TriggerEvent('mirrox-inventoryhud:createdInventory', identifier, type, data)
    end)
end

function deleteInventory(identifier, type)
    MySQL.Async.execute('DELETE FROM mirrox_inventory WHERE owner = @owner AND type = @type', {
        ['@owner'] = identifier,
        ['@type'] = type
    }, function()
        TriggerEvent('mirrox-inventoryhud:deletedInventory', identifier, type)
    end)
end

function getDisplayInventory(identifier, type, cb, source)
    local player = ESX.GetPlayerFromId(source)
    InvType[type].getInventory(identifier, function(inventory)
        local itemsObject = {}

        for k, v in pairs(inventory) do
            local esxItem = player.getInventoryItem(v.name)
            local item = createDisplayItem(v, esxItem, tonumber(k))
            table.insert(itemsObject, item)
        end

        local inv = {
            invId = identifier,
            invTier = InvType[type],
            inventory = itemsObject,
        }
        cb(inv)
    end)
end

function getInventory(identifier, type, cb)
    if loadedInventories[type][identifier] ~= nil then
        cb(loadedInventories[type][identifier])
    else
        loadInventory(identifier, type, cb)
    end
end

function applyToInventory(identifier, type, f)
    if loadedInventories[type][identifier] ~= nil then
        f(loadedInventories[type][identifier])
    else
        loadInventory(identifier, type, function()
            applyToInventory(identifier, type, f)
        end)
    end
    if loadedInventories[type][identifier] and table.length(loadedInventories[type][identifier]) > 0 then
        TriggerEvent('disc-inventoryhud:modifiedInventory', identifier, type, loadedInventories[type][identifier])
    else
        TriggerEvent('disc-inventoryhud:modifiedInventory', identifier, type, nil)
    end
end

function loadInventory(identifier, type, cb)
    MySQL.Async.fetchAll('SELECT data FROM mirrox_inventory WHERE owner = @owner and type = @type', {
        ['@owner'] = identifier,
        ['@type'] = type
    }, function(result)
        if #result == 0 then
            loadedInventories[type][identifier] = {}
            cb({})
            return
        end
        inventory = json.decode(result[1].data)
        loadedInventories[type][identifier] = inventory
        cb(inventory)
        TriggerEvent('disc-inventoryhud:loadedInventory', identifier, type, inventory)
    end)
end

function handleWeaponRemoval(data, source)
    if isWeapon(data.originItem.id) then
        if data.originOwner == data.destinationOwner and data.originTier.name == data.destinationTier.name then
            if data.destinationSlot > 5 then
                TriggerClientEvent('mirrox-inventoryhud:removeCurrentWeapon', source)
            end
        else
            TriggerClientEvent('mirrox-inventoryhud:removeCurrentWeapon', source)
        end
    end
end