ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offpolice', 0)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offpolice', 1)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offpolice', 2)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offpolice', 3)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offpolice', 4)
    end

    if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
        xPlayer.setJob('police', 0)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
        xPlayer.setJob('police', 1)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
        xPlayer.setJob('police', 2)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
        xPlayer.setJob('police', 3)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
        xPlayer.setJob('police', 4)
    end
end)

RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offambulance', 1)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offambulance', 2)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offambulance', 3)
    end

    if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('ambulance', 1)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('ambulance', 2)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('ambulance', 3)
    end
end)

RegisterServerEvent('duty:cardealer')
AddEventHandler('duty:cardealer', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'cardealer' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offcardealer', 1)
    elseif xPlayer.job.name == 'cardealer' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offcardealer', 2)
    elseif xPlayer.job.name == 'cardealer' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offcardealer', 3)
    end

    if xPlayer.job.name == 'offcardealer' and xPlayer.job.grade == 1 then
        xPlayer.setJob('cardealer', 1)
    elseif xPlayer.job.name == 'offcardealer' and xPlayer.job.grade == 2 then
        xPlayer.setJob('cardealer', 2)
    elseif xPlayer.job.name == 'offcardealer' and xPlayer.job.grade == 3 then
        xPlayer.setJob('cardealer', 3)
    end
end)

RegisterServerEvent('duty:bennys')
AddEventHandler('duty:bennys', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'bennys' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offbennys', 1)
    elseif xPlayer.job.name == 'bennys' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offbennys', 2)
    elseif xPlayer.job.name == 'bennys' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offbennys', 3)
    elseif xPlayer.job.name == 'bennys' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offbennys', 4)
    end

    if xPlayer.job.name == 'offbennys' and xPlayer.job.grade == 1 then
        xPlayer.setJob('bennys', 1)
    elseif xPlayer.job.name == 'offbennys' and xPlayer.job.grade == 2 then
        xPlayer.setJob('bennys', 2)
    elseif xPlayer.job.name == 'offbennys' and xPlayer.job.grade == 3 then
        xPlayer.setJob('bennys', 3)
    elseif xPlayer.job.name == 'offbennys' and xPlayer.job.grade == 4 then
        xPlayer.setJob('bennys', 4)
    end
end)

RegisterServerEvent('duty:taxi')
AddEventHandler('duty:taxi', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'taxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offtaxi', 1)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offtaxi', 2)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offtaxi', 3)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offtaxi', 4)
    end

    if xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('taxi', 1)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('taxi', 2)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('taxi', 3)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('taxi', 4)
    end
end)

RegisterServerEvent('duty:mechanic')
AddEventHandler('duty:mechanic', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offmechanic', 1)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offmechanic', 2)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offmechanic', 3)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offmechanic', 4)
    end

    if xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 1 then
        xPlayer.setJob('mechanic', 1)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 2 then
        xPlayer.setJob('mechanic', 2)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 3 then
        xPlayer.setJob('mechanic', 3)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 4 then
        xPlayer.setJob('mechanic', 4)
    end
end)