ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----------------
--== EVENTS ==--
----------------

ESX.RegisterServerCallback('andreas_motell:getMotellList', function(source, cb)
  local identifier = ESX.GetPlayerFromId(source).identifier
  local xPlayer = ESX.GetPlayerFromId(source)

        MySQL.Async.fetchAll(
        'SELECT * FROM owned_motells WHERE identifier = @identifier',
        {
            ['@identifier'] = '0',
        }, function(result)

      cb(result)
    end)
end)

ESX.RegisterServerCallback('andreas_motell:getOwnedRoom', function(source, cb, id)
    local src = source

    local player = ESX.GetPlayerFromId(src)
    local identifier = player.identifier
    
    local fetchSQL = [[
        SELECT * FROM owned_motells WHERE DoorNumber = @DoorNumber AND identifier = @identifier
    ]]

    MySQL.Async.fetchAll(fetchSQL,
        {
            ['@DoorNumber'] = id,
            ['@identifier'] = identifier,
        }, 

    function(result)
        if result[1] ~= nil then
            cb(true)
        else
            cb(false)
        end
    end)
    
end)

ESX.RegisterServerCallback('andreas_motell:checkRoom', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT identifier FROM owned_motells WHERE identifier = @identifier',
	{
		['@identifier'] = identifier,
	}, function(result)

		if result ~= nil then
			cb(true)
		else
			cb(false)
		end

	end)
end)

RegisterServerEvent('andreas_motells:BuyRoom')
AddEventHandler('andreas_motells:BuyRoom', function(price, number, hasbought)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = ESX.GetPlayerFromId(source).identifier

    MySQL.Async.fetchAll(
    'SELECT identifier FROM owned_motells WHERE DoorNumber = @DoorNumber',
    {
      ['@DoorNumber'] = number,
    }, function(result)

    if result[1].identifier == '0' then

        if xPlayer.getMoney() >= price then
            MySQL.Async.fetchAll("UPDATE owned_motells SET identifier = @identifier WHERE DoorNumber = @DoorNumber",{['@identifier']  = identifier,['@DoorNumber']     = number},function(result)
            xPlayer.removeMoney(price)
            print( identifier .. ' Bought room number #' .. number .. ' for' .. price .. ' KR')
        end)
            TriggerClientEvent('esx:showNotification', _source, 'Du köpte rum #'..number.. ' för ' ..  price .. 'KR')
        else    
            TriggerClientEvent('esx:showNotification', _source, 'Du har inte råd med detta motellrum')
        end
    else
        TriggerClientEvent('esx:showNotification', _source, 'Du har inte råd med detta motellrum')
        end
    end)
end)

-- STORAGE -- 
RegisterServerEvent('andreas_motell:getItem')
AddEventHandler('andreas_motell:getItem', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)

	if type == 'item_standard' then

		local sourceItem = xPlayer.getInventoryItem(item)

		TriggerEvent('esx_addoninventory:getInventory', 'motell', xPlayer.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)

			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
			
				-- can the player carry the said amount of x item?
				if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
					TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
				else
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
					TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
				end
			else
				TriggerClientEvent('esx:showNotification', _source, _U('not_enough_in_property'))
			end
		end)

	elseif type == 'item_account' then

		TriggerEvent('esx_addonaccount:getAccount', 'motell_' .. item, xPlayer.identifier, function(account)
			local roomAccountMoney = account.money

			if roomAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
			end
		end)

	elseif type == 'item_weapon' then

		TriggerEvent('esx_datastore:getDataStore', 'motell', xPlayer.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)
		end)

	end

end)

RegisterServerEvent('andreas_motell:putItem')
AddEventHandler('andreas_motell:putItem', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	if type == 'item_standard' then

		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', 'motell', xPlayer.identifier, function(inventory)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_deposited', count, inventory.getItem(item).label))
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
		end

	elseif type == 'item_account' then

		local playerAccountMoney = xPlayer.getAccount(item).money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', 'motell_' .. item, xPlayer.identifier, function(account)
				account.addMoney(count)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
		end

	elseif type == 'item_weapon' then

		TriggerEvent('esx_datastore:getDataStore', 'motell', xPlayer.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}

			table.insert(storeWeapons, {
				name = item,
				ammo = count
			})

			store.set('weapons', storeWeapons)
			xPlayer.removeWeapon(item)
		end)

	end

end)

ESX.RegisterServerCallback('andreas_motell:getPropertyInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'motell_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'motell', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'motell', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('andreas_motell:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)