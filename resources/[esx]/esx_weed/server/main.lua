ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_weed:add')
AddEventHandler('esx_weed:add', function(drugnumber, x, y, z, time)
    local identifier = ESX.GetPlayerFromId(source).identifier
    local _source = source
    local result = MySQL.Sync.fetchAll("SELECT x FROM user_drugs WHERE x = @x", {['@x'] = x})
    local xPlayer = ESX.GetPlayerFromId(_source)
    local seed = xPlayer.getInventoryItem('seed').count
    if seed >= 1 then
        if result[1] == nil then
            MySQL.Async.execute('INSERT INTO user_drugs (identifier, drugnumber, x, y, z, time) VALUES (@identifier, @drugnumber, @x, @y, @z, @time)',
                {
                    ['@identifier']   = identifier,
                    ['@drugnumber']    = drugnumber,
                    ['@x']     = x,
                    ['@y'] = y,
                    ['@z'] = z,
                    ['@time'] = time,
                }
            )
            Wait(10)
            xPlayer.removeInventoryItem('seed', 1)
            TriggerClientEvent('esx_weed:plant', _source, x, y, z)
            Wait(10)
            TriggerClientEvent('notification', _source, "Du har planterat en planta.")
        else
            TriggerClientEvent('notification', _source, "Gick ej att plantera här.")
        end
    else
        TriggerClientEvent('notification', _source, "Du har inga frön.")
    end
end)

RegisterServerEvent('esx_weed:water')
AddEventHandler('esx_weed:water', function(drugnumber)
    local identifier = ESX.GetPlayerFromId(source).identifier
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local result = MySQL.Sync.fetchAll("SELECT water, time FROM user_drugs WHERE drugnumber = @x", {['@x'] = drugnumber})
    local waternumber = result[1]
    local waterItem = xPlayer.getInventoryItem('water').count
    if result[1] ~= nil then
        if result[1].water == 2 then
            waternumber = 1
        elseif result[1].water == 1 then
            waternumber = 0
        end
        if result[1].water > 0 then
            if result[1].time > 0 then
                TriggerClientEvent('notification', _source, 'Du kan ej vattna plantan, det är ' ..result[1].time.. ' minuter kvar innan nästa vattning.', "error")
            else
                if waterItem >= Config.WaterNeeded then
                    MySQL.Async.execute(
                        'UPDATE `user_drugs` SET water = @water WHERE drugnumber = @drugnumber',
                        {
                        ['@water'] = waternumber,
                        ['@drugnumber'] = drugnumber
                    }   )
                    TriggerClientEvent('esx_weed:waterCL', _source)
                    Wait(5500) --waits for notifications

                    if waternumber == 1 then
                        TriggerClientEvent('notification', _source, 'Du vattnade plantan, nu behöver du bara vattna ' ..waternumber .. ' gånger till', "success")
                    elseif waternumber == 2 then
                        TriggerClientEvent('notification', _source, "Du vattnade plantan.")
                    end

                    xPlayer.removeInventoryItem('water', 2)
                    TriggerEvent('esx_weed:time', drugnumber) -- resets time to 15 minutes
                else
                    TriggerClientEvent('notification', _source, 'Du har ej tillräckligt med ~b~vatten, du behöver ' .. Config.WaterNeeded - waterItem, "error")
                end
            end
        else
            TriggerClientEvent('notification', _source, "Plantan har blivit vattnad tillräckligt.")
        end
    else
        TriggerClientEvent('notification', _source, "Det finns ingen planta här.")
    end
end)

RegisterServerEvent('esx_weed:take')
AddEventHandler('esx_weed:take', function(drugnumber)
    local identifier = ESX.GetPlayerFromId(source).identifier
    local _source = source
    local result = MySQL.Sync.fetchAll("SELECT water, time, x, y, z FROM user_drugs WHERE drugnumber = @x", {['@x'] = drugnumber})
    local randomWeed = math.random(35, 50)
    local randomSeed = math.random(1, 3)
    if result[1] ~= nil then
        if result[1].water == 0 then
            if result[1].time == 0 then
                MySQL.Async.execute(
                    'DELETE FROM `user_drugs` WHERE drugnumber = @drugnumber',
                    {
                    ['@drugnumber'] = drugnumber
                }   )
                TriggerClientEvent('esx_weed:takeCL', _source)
                Wait(8500)
                TriggerClientEvent('notification', _source, 'Du skördade plantan, du fick ' ..randomWeed .. ' cannabis', "success")
                local xPlayer = ESX.GetPlayerFromId(_source)
                xPlayer.addInventoryItem('cannabis', randomWeed)
                xPlayer.addInventoryItem('seed', randomSeed)
                TriggerClientEvent('esx_weed:removeObjects', -1, result[1].x, result[1].y, result[1].z)
            else
                TriggerClientEvent('notification', _source, 'Du kan ej skörda plantan än, det är  '..result[1].time.. ' minuter kvar', "error")
            end
        else
            TriggerClientEvent('notification', _source, 'Du kan ej skörda, plantan behöver vattnas ' .. result[1].water.. ' gång till', "error")
        end
    else
        TriggerClientEvent('notification', _source, "Det finns ingen planta här.")
    end
end)

RegisterServerEvent('esx_weed:destroy')
AddEventHandler('esx_weed:destroy', function(drugnumber)
    local identifier = ESX.GetPlayerFromId(source).identifier
    local _source = source
    local result = MySQL.Sync.fetchAll("SELECT water, time, x, y, z FROM user_drugs WHERE drugnumber = @x", {['@x'] = drugnumber})
            MySQL.Async.execute(
                'DELETE FROM `user_drugs` WHERE drugnumber = @drugnumber',
                {
                ['@drugnumber'] = drugnumber
            }   )
    TriggerClientEvent('esx_weed:takeCL', _source)
    Wait(8500)
    TriggerClientEvent('notification', _source, "Du förstörde plantan och fick ingenting.")
    TriggerClientEvent('esx_weed:removeObjects', -1, result[1].x, result[1].y, result[1].z)
end)

RegisterServerEvent('esx_weed:time')
AddEventHandler('esx_weed:time', function(drugnumber)
    local result = MySQL.Sync.fetchAll("SELECT time FROM user_drugs WHERE drugnumber = @dn", {['@dn'] = drugnumber})
    if result[1].time > 0 then
        timeleft = result[1].time
    else
        timeleft = 15
    end
    MySQL.Async.execute(
        'UPDATE `user_drugs` SET time = @time WHERE drugnumber = @drugnumber',
        {
        ['@drugnumber'] = drugnumber,
        ['@time'] = timeleft - 1
    }   )
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        local result = MySQL.Sync.fetchAll("SELECT time, drugnumber FROM user_drugs", {})
        for i=1, #result, 1 do
            if result[i].time > 0 then
                TriggerEvent('esx_weed:time', result[i].drugnumber)
            end
        end
    end
end)

--gets drugs
ESX.RegisterServerCallback('esx_weed:getDrugs', function(source, cb)
    local identifier = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('SELECT x,y,z,drugnumber FROM user_drugs', {},
    function(result)
    if identifier ~= nil then
        local drugs = {}

        for i=1, #result, 1 do
            table.insert(drugs, {
                x = result[i].x,
                y = result[i].y,
                z = result[i].z,
                number = result[i].drugnumber
            })
        end
            cb(drugs)
        else
        end
    end)
    Citizen.Wait(3000)
end)

ESX.RegisterServerCallback('esx_weed:getTime', function(source, cb)
    local identifier = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('SELECT drugnumber, time FROM user_drugs', {},
    function(result)
    if identifier ~= nil then
        local drugs = {}

        for i=1, #result, 1 do
            table.insert(drugs, {
                time = result[i].time,
                number = result[i].drugnumber
            })
        end
            cb(drugs)
        else
        end
    end)
end)

ESX.RegisterUsableItem('rizla', function(source)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(source)
    local weedQuantity = xPlayer.getInventoryItem('cannabis').count

    if weedQuantity >= 5 then
        TriggerClientEvent('esx_weed:roll', _source)
        Wait(5000)
        xPlayer.removeInventoryItem('rizla', 1)
        xPlayer.removeInventoryItem('cannabis', 5)
        xPlayer.addInventoryItem('joint', 5)
    else
        TriggerClientEvent('notification', _source, 'Du har ej tillräckligt med cannabis, du behöver ' .. 5 - weedQuantity .. ' st.', "error")
    end

end)


--notification
function sendNotification(xSource, message, messageType)
	TriggerClientEvent("pNotify:SendNotification", xSource, {text = message, type = messageType, timeout = 5000, layout = "bottomCenter"})
end