
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Vehicles

RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)

	if Config.IsBennysJobOnly == true then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bennys', function(account)
			accountMoney = account.money
			if accountMoney >= price then
				TriggerClientEvent('esx_lscustom:installMod', _source)
				TriggerClientEvent('esx:showNotification', _source, _U('purchased') .. " -" .. price .. ":-")
				account.removeMoney(price)
			else
				TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
				TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
			end
		end)
	end
end)


RegisterServerEvent('esx_lscustom:refreshOwnedVehicle')
AddEventHandler('esx_lscustom:refreshOwnedVehicle', function(myCar)
	MySQL.Async.execute(
		'UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `vehicle` LIKE "%' .. myCar['plate'] .. '%"',
		{
			['@vehicle'] = json.encode(myCar)
		}
	)
end)

ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if not Vehicles then
		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)

