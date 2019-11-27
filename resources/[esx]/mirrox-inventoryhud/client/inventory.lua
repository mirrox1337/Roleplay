secondInventory = nil

RegisterNUICallback('MoveToEmpty', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:MoveToEmpty', data)
    TriggerEvent('mirrox-inventoryhud:MoveToEmpty', data)
    cb('OK')
end)

RegisterNUICallback('EmptySplitStack', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:EmptySplitStack', data)
    TriggerEvent('mirrox-inventoryhud:EmptySplitStack', data)
    cb('OK')
end)

RegisterNUICallback('SplitStack', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:SplitStack', data)
    TriggerEvent('mirrox-inventoryhud:SplitStack', data)
    cb('OK')
end)

RegisterNUICallback('CombineStack', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:CombineStack', data)
    TriggerEvent('mirrox-inventoryhud:CombineStack', data)
    cb('OK')
end)

RegisterNUICallback('SwapItems', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:SwapItems', data)
    TriggerEvent('mirrox-inventoryhud:SwapItems', data)
    cb('OK')
end)

RegisterNUICallback('GiveItem', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:notifyImpendingRemoval', data.item, data.number)
    TriggerServerEvent('mirrox-inventoryhud:GiveItem', data)
    cb('OK')
end)

RegisterNUICallback('GiveCash', function(data, cb)
    TriggerServerEvent('mirrox-inventoryhud:GiveCash', data)
    cb('OK')
end)

RegisterNUICallback('GetNearPlayers', function(data)

    if data.action == 'give' then
        SendNUIMessage({
            action = "nearPlayersGive",
            players = GetNeareastPlayers(),
            item = data.item
        })
    end

    if data.action == 'pay' then
        SendNUIMessage({
            action = "nearPlayersPay",
            players = GetNeareastPlayers(),
        })
    end
end)

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 2.0)

    local players_clean = {}
    local found_players = false

    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            table.insert(players_clean, { name = GetPlayerName(players[i]), id = GetPlayerServerId(players[i]) })
        end
    end
    return players_clean
end

RegisterNetEvent('mirrox-inventoryhud:refreshInventory')
AddEventHandler('mirrox-inventoryhud:refreshInventory', function()
    refreshPlayerInventory()
    if secondInventory ~= nil then
        refreshSecondaryInventory()
    end
    Citizen.Wait(100)
    SendNUIMessage({
        action = "unlock"
    })
end)

function refreshPlayerInventory()
    Citizen.Wait(50)
    ESX.TriggerServerCallback('mirrox-inventoryhud:getPlayerInventory', function(data)
        SendNUIMessage(
                { action = "setItems",
                  itemList = data.inventory,
                  invOwner = data.invId,
                  invTier = data.invTier,
                  money = {
                      cash = data.cash,
                      bank = data.bank,
                      black_money = data.black_money
                  }
                }
        )
        TriggerServerEvent('mirrox-inventoryhud:openInventory', {
            type = 'player',
            owner = ESX.GetPlayerData().identifier
        })
    end, 'player', ESX.GetPlayerData().identifier)
end

function refreshSecondaryInventory()
    ESX.TriggerServerCallback('mirrox-inventoryhud:getSecondaryInventory', function(data)
        SendNUIMessage(
                { action = "setSecondInventoryItems",
                  itemList = data.inventory,
                  invOwner = data.invId,
                  invTier = data.invTier,
                }
        )
        TriggerServerEvent('mirrox-inventoryhud:openInventory', secondInventory)
    end, secondInventory.type, secondInventory.owner)
end

function closeInventory()
    isInInventory = false
    SendNUIMessage({ action = "hide" })
    SetNuiFocus(false, false)
    TriggerServerEvent('mirrox-inventoryhud:closeInventory', {
        type = 'player',
        owner = ESX.GetPlayerData().identifier
    })
    if secondInventory ~= nil then
        TriggerServerEvent('mirrox-inventoryhud:closeInventory', secondInventory)
    end
end

RegisterNetEvent('mirrox-inventoryhud:openInventory')
AddEventHandler('mirrox-inventoryhud:openInventory', function(sI)
    openInventory(sI)
end)

function openInventory(_secondInventory)
    isInInventory = true
    refreshPlayerInventory()
    SendNUIMessage({
        action = "display",
        type = "normal"
    })
    if _secondInventory ~= nil then
        secondInventory = _secondInventory
        refreshSecondaryInventory()
        SendNUIMessage({
            action = "display",
            type = 'secondary'
        })
        if _secondInventory.seize then
            SendNUIMessage({
                action = "showSeize"
            })
        end
        if _secondInventory.steal then
            SendNUIMessage({
                action = "showSteal"
            })
        end
    end
    SetNuiFocus(true, true)
end

RegisterNetEvent("mirrox-inventoryhud:MoveToEmpty")
AddEventHandler("mirrox-inventoryhud:MoveToEmpty", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("mirrox-inventoryhud:EmptySplitStack")
AddEventHandler("mirrox-inventoryhud:EmptySplitStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("mirrox-inventoryhud:SplitStack")
AddEventHandler("mirrox-inventoryhud:SplitStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("mirrox-inventoryhud:CombineStack")
AddEventHandler("mirrox-inventoryhud:CombineStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("mirrox-inventoryhud:SwapItems")
AddEventHandler("mirrox-inventoryhud:SwapItems", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

function playPickupOrDropAnimation(data)
    if data.originTier.name == 'drop' or data.destinationTier.name == 'drop' then
        local playerPed = GetPlayerPed(-1)
        if not IsEntityPlayingAnim(playerPed, 'random@domestic', 'pickup_low', 3) then
            ESX.Streaming.RequestAnimDict('random@domestic', function()
                TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, -1, 48, 0, 0, 0, 0)
            end)
        end
    end
end

function playStealOrSearchAnimation(data)
    if data.originTier.name == 'player' and data.destinationTier.name == 'player' then
        local playerPed = GetPlayerPed(-1)
        if not IsEntityPlayingAnim(playerPed, 'random@mugging4', 'agitated_loop_a', 3) then
            ESX.Streaming.RequestAnimDict('random@mugging4', function()
                TaskPlayAnim(playerPed, 'random@mugging4', 'agitated_loop_a', 8.0, -8, -1, 48, 0, 0, 0, 0)
            end)
        end
    end
end 