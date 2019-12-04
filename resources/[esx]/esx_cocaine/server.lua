ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_cocaine:grind")
AddEventHandler("esx_cocaine:grind", function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local PartCount = xPlayer.getInventoryItem("cocaineleaf").count
    local PartCount1 = xPlayer.getInventoryItem("grinder").count
    
    if PartCount > 0 and PartCount1 > 0 then
        xPlayer.removeInventoryItem("cocaineleaf", PartCount)
        xPlayer.addInventoryItem("cocainepowder", PartCount)
    else
        sendNotifcation(source, 'Du har inga kokablad eller Kokain Grinder.', 'error', 5000)
    end

end)

RegisterServerEvent("esx_cocaine:mix")
AddEventHandler("esx_cocaine:mix", function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local PartCount1 = xPlayer.getInventoryItem("cocainepowder").count
    local PartCount2 = xPlayer.getInventoryItem("chemicals").count
    local PartCount3 = xPlayer.getInventoryItem("fuel").count
    local PartCount4 = xPlayer.getInventoryItem("cement").count
    local PartCount5 = xPlayer.getInventoryItem("causticsoda").count
    
    if PartCount1 > 19 and PartCount4 > 0 and PartCount2 > 1 and PartCount3 > 0 and PartCount5 > 0 then
        xPlayer.removeInventoryItem("cocainepowder", 20)
        xPlayer.removeInventoryItem("chemicals", 2)
        xPlayer.removeInventoryItem("fuel", 1)
        xPlayer.removeInventoryItem("cement", 1)
        xPlayer.removeInventoryItem("causticsoda", 2)
        xPlayer.addInventoryItem("rawcocaine", 15)
    end

end)

RegisterServerEvent("esx_cocaine:pack")
AddEventHandler("esx_cocaine:pack", function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local PartCount1 = xPlayer.getInventoryItem("rawcocaine").count
    local PartCount2 = xPlayer.getInventoryItem("plasticbag").count
    local PartCount3 = xPlayer.getInventoryItem("scale").count
    
    if PartCount1 > 0 and PartCount2 > 0 and PartCount3 > 0 then
        xPlayer.removeInventoryItem("plasticbag", PartCount2)
        xPlayer.removeInventoryItem("rawcocaine", PartCount1)
        xPlayer.addInventoryItem("cocaine", PartCount1)
    else
        sendNotifcation(source, 'Du har inget kokain att paketera eller så har du ingen våg.', 'error', 5000)
    end

end)

ESX.RegisterServerCallback("esx_cocaine:checkGrind", function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local PartCount1 = xPlayer.getInventoryItem("cocaineleaf").count
    local PartCount2 = xPlayer.getInventoryItem("grinder").count

	if PartCount1 > 0 and PartCount2 > 0 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("esx_cocaine:checkPack", function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local PartCount1 = xPlayer.getInventoryItem("rawcocaine").count
    local PartCount2 = xPlayer.getInventoryItem("plasticbag").count
    local PartCount3 = xPlayer.getInventoryItem("scale").count

	if PartCount1 > 0 and PartCount2 > 0 and PartCount3 > 0 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("esx_cocaine:checkIngredients", function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local PartCount1 = xPlayer.getInventoryItem("cocainepowder").count
    local PartCount2 = xPlayer.getInventoryItem("chemicals").count
    local PartCount3 = xPlayer.getInventoryItem("fuel").count
    local PartCount4 = xPlayer.getInventoryItem("cement").count
    local PartCount5 = xPlayer.getInventoryItem("causticsoda").count

	if PartCount1 > 19 and PartCount2 > 1 and PartCount3 > 0 and PartCount4 > 0 and PartCount5 > 0 then
        cb(true)
    else
        cb(false)
    end
end)

function sendNotifcation(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "cocaine",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end