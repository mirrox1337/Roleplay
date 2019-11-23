ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord (name,message,color)
  local DiscordWebHook = Config.webhook

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
        ["text"]= "NERP Discord serverlogs",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

sendToDiscord(_U('server'),_U('server_start'),Config.green)

AddEventHandler('chatMessage', function(author, color, message)
  if(settings.LogChatServer)then
      local player = ESX.GetPlayerFromId(author)
     sendToDiscord(_U('server_chat'), player.name .." : "..message,Config.grey)
  end
end)

RegisterServerEvent("esx:playerconnected")
AddEventHandler('esx:playerconnected', function()
  if(settings.LogLoginServer)then
    sendToDiscord(_U('server_connecting'), GetPlayerName(source) .." ".. _('user_connecting'),Config.grey)
  end
end)

AddEventHandler('playerDropped', function(reason)
  if(settings.LogLoginServer)then
    sendToDiscord(_U('server_disconnecting'), GetPlayerName(source) .." ".. _('user_disconnecting') .. "("..reason..")",Config.grey)
  end
end)

RegisterServerEvent("ne-logs:giveItem")
AddEventHandler("ne-logs:giveItem", function(name,nametarget,itemname,amount)
   if(settings.LogItemTransfer)then
    sendToDiscord(_U('server_item_transfer'),name.._('user_gives_to')..nametarget.." "..amount .." "..itemname,Config.orange)
   end

end)

RegisterServerEvent("ne-logs:giveMoney")
AddEventHandler("ne-logs:giveMoney", function(name,nametarget,amount)
  if(settings.LogMoneyTransfer)then
    sendToDiscord(_U('server_money_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..amount .." dollars",Config.orange)
  end

end)

RegisterServerEvent("ne-logs:giveBank")
AddEventHandler("ne-logs:giveBank", function(name,nametarget,amount)
  if(settings.LogMoneyBankTransfer)then
   sendToDiscord(_U('server_moneybank_transfer'),name.." ".. _('user_gives_to') .." "..nametarget.." "..amount .." dollars",Config.orange)
  end

end)

RegisterServerEvent("ne-logs:giveWeapon")
AddEventHandler("ne-logs:giveWeapon", function(name,nametarget,weaponlabel)
  if(settings.LogWeaponTransfer)then
    sendToDiscord(_U('server_weapon_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..weaponlabel,Config.orange)
  end

end)

RegisterServerEvent("ne-logs:stealVehicle")
AddEventHandler("ne-logs:stealVehicle", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('server_carjacking'),xPlayer.name.." ".._('user_carjacking').." ".. model,Config.purple)

end)

RegisterServerEvent('ne-logs:playerKill')
AddEventHandler('ne-logs:playerKill', function(t,killer, kilerT) -- t : 0 = NPC, 1 = player
  local xPlayer = ESX.GetPlayerFromId(source)
  if(t == 1) then
     local xPlayer = ESX.GetPlayerFromId(source)
     local xPlayerKiller = ESX.GetPlayerFromId(killer)

     if(xPlayerKiller.name ~= nil and xPlayer.name ~= nil)then

       if(kilerT.killerinveh) then
         local model = kilerT.killervehname
            sendToDiscord(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name.." ".._('with').." "..model,Config.red)
       else
            sendToDiscord(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name,Config.red)
       end
    end
  else
     sendToDiscord(_U('server_kill'), xPlayer.name .." ".. _('user_kill_environnement'),Config.red)
  end

end)
