--Copyright ZAUB1
--N'hesitez pas a rejoindre mon discord : https://discord.gg/yFuSEGj
--Et a me contacter directement pour tout bug ou suggestions

--ESX INIT--

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--EVENTS--

RegisterServerEvent('pizza:pourboire') --Paie a la livraison d'une pizza + pourboire eventuel
AddEventHandler('pizza:pourboire', function(pourboire)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(pourboire)
end)

RegisterServerEvent('pizza:leverans') 
AddEventHandler('pizza:leverans', function(pourboire)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney (math.random(15, 20))
end)

RegisterServerEvent("pizza:paiefinale") --Paie "bonus" lors de la fin de service
AddEventHandler("pizza:paiefinale", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local flouzefin = math.random(20, 25)

	xPlayer.addMoney(flouzefin)

TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Här är din lilla slutliga bonus: ' .. flouzefin .. 'SEK' })

end)

RegisterServerEvent("pizza:itemadd") --Ajout temporaire de l'item "pizza"
AddEventHandler("pizza:itemadd", function(nbPizza)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	--xPlayer.addInventoryItem('pizza', tonumber(nbPizza))
end)

RegisterServerEvent("pizza:itemrm") --Rm de l'item "pizza"
AddEventHandler("pizza:itemrm", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	--xPlayer.removeInventoryItem('pizza', 1)
end)

RegisterServerEvent("pizza:deleteAllPizz") --Rm de l'item "pizza"
AddEventHandler("pizza:deleteAllPizz", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	--local pizzanbr = xPlayer.getInventoryItem('pizza').count
	
	--xPlayer.removeInventoryItem('pizza', pizzanbr)
end)
