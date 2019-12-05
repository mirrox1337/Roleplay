ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_fishing:sellFish')
AddEventHandler('esx_fishing:sellFish', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local fishQuantity = xPlayer.getInventoryItem('fish').count
	local randomMoney = math.random(30, 50)
	
	if fishQuantity == 0 then
	TriggerClientEvent('notification', _source, 'Du har inga fiskar att sälja.', "error")
	else
	xPlayer.removeInventoryItem('fish', fishQuantity)
	xPlayer.addMoney(fishQuantity * 25)
	--sendNotification(_source, 'Du sålde ' .. fishQuantity .. ' fiskar för ' .. fishQuantity * randomMoney .. ' SEK', 'success', 3500)
	TriggerClientEvent('notification', _source, 'Sålde ' .. fishQuantity .. ' fisk(ar) för ' .. fishQuantity * 25 .. ' SEK', "error")
	end

end)

RegisterServerEvent('esx_fishing:useBait')
AddEventHandler('esx_fishing:useBait', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('bait', 1)

end)


RegisterServerEvent('esx_fishing:giveFish')
AddEventHandler('esx_fishing:giveFish', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local fishQuantity = xPlayer.getInventoryItem('fish').count
	local randomWeight = math.random(700, 5000)
	
	if fishQuantity <= 200 then

		xPlayer.addInventoryItem('fish', 1)
	end

end)
