ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('andreas_hambrant:checkMoney', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)
    local pedmoney = xPlayer.getMoney()
    local price = Config.BuyCost

    if pedmoney > price then
        cb(true)
    else
        cb(false)
    end

end)

RegisterServerEvent('andreas_hambrant:giveItem')
AddEventHandler('andreas_hambrant:giveItem', function()
    
    local xPlayer = ESX.GetPlayerFromId(source)
    local items = Config.ItemsNeeded
    local randomItem = items[math.random(#items)]
    local randomCount = math.random(1, 3)

    xPlayer.addInventoryItem(randomItem, randomCount)
    xPlayer.removeMoney(price)

end)


RegisterServerEvent('andreas_hambrant:cook')
AddEventHandler('andreas_hambrant:cook', function()
    
   local xPlayer = ESX.GetPlayerFromId(source)

   local turbojastcount = xPlayer.getInventoryItem('turbojast').count
   local sockercount = xPlayer.getInventoryItem('socker').count
   local vattencount = xPlayer.getInventoryItem('water').count
   local kolcount = xPlayer.getInventoryItem('kol').count
   local corncount = xPlayer.getInventoryItem('corn').count

   local waittime = Config.CookTime / 5

   xPlayer.removeInventoryItem('kol', 1)
   Wait(waittime)
   xPlayer.removeInventoryItem('socker', 1)
   Wait(waittime)
   xPlayer.removeInventoryItem('water', 1)
   Wait(waittime)
   xPlayer.removeInventoryItem('turbojast', 1)
   Wait(waittime)
   xPlayer.removeInventoryItem('corn', 1)
   Wait(waittime)
   xPlayer.addInventoryItem('hembrantdunk', Config.RecieveAmount)


end)

ESX.RegisterServerCallback('andreas_hambrant:checkItems', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)
    local turbojastcount = xPlayer.getInventoryItem('turbojast').count
    local sockercount = xPlayer.getInventoryItem('socker').count
    local vattencount = xPlayer.getInventoryItem('water').count
    local kolcount = xPlayer.getInventoryItem('kol').count
    local corncount = xPlayer.getInventoryItem('corn').count

    if turbojastcount and sockercount and vattencount and kolcount and corncount > 0 then
        cb(true)
    else 
        cb(false)
    end

end)
