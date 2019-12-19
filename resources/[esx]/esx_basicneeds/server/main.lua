ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatSandwich', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_bread') })
end)

ESX.RegisterUsableItem('chips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEatChips', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_chips'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_chips') })
end)

ESX.RegisterUsableItem('korv', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('korv', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEatKorv', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_chips'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_korv') })
end)

ESX.RegisterUsableItem('hamburgare', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburgare', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEatHamburgare', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_chips'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_hamburgare') })
end)

ESX.RegisterUsableItem('choklad', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('choklad', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEatChoklad', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_chips'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_choklad') })
end)

ESX.RegisterUsableItem('donut', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 125555)
	TriggerClientEvent('esx_basicneeds:onEatDonut', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_chips'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_donut') })
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_water'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_water') })
end)

ESX.RegisterUsableItem('cola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 185000)
	TriggerClientEvent('esx_basicneeds:onDrickCola', source)
	--TriggerClientEvent('esx:showNotification', source, _U('used_water'))
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_cola') })
end)

TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local playerId = tonumber(args[1])

		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', playerId)
				--TriggerClientEvent('chat:addMessage', source, { args = { '^5HEAL', 'You have been healed.' } })
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du har blivit healad' })
			else
				--TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Spelaren är inte Online' })
			end
		else
			--TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player id.' } })
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Kunde inte hitta PlayerID' })
		end
	else
		print(('esx_basicneeds: %s healed self'):format(GetPlayerIdentifier(source, 0)))
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	--TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'warning', text = 'Du har inga rättigheter för detta kommando' })
end, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', params = {{name = 'playerId', help = '(optional) player id'}}})