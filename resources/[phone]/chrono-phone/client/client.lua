ESX               = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  Citizen.Wait(5000)
  PlayerData = ESX.GetPlayerData()
end)

 local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
-- Configuration
local KeyToucheCloseEvent = {
  { code = 172, event = 'ArrowUp' },
  { code = 173, event = 'ArrowDown' },
  { code = 174, event = 'ArrowLeft' },
  { code = 175, event = 'ArrowRight' },
  { code = 176, event = 'Enter' },
  { code = 177, event = 'Backspace' },
}
local KeyOpenClose = 288 -- F2
local KeyTakeCall = 38 -- E
local menuIsOpen = false
local contacts = {}
local messages = {}
local myPhoneNumber = ''
local isDead = false
local USE_RTC = false
local useMouse = false
local ignoreFocus = false
local takePhoto = false
local hasFocus = false

local PhoneInCall = {}
local currentPlaySound = false
local soundDistanceMax = 8.0
local TokoVoipID = nil


--====================================================================================
--  Check si le joueurs poséde un téléphone
--  Callback true or false
--====================================================================================
function hasPhone (cb)
  cb(true)
end
--====================================================================================
--  Que faire si le joueurs veut ouvrir sont téléphone n'est qu'il en a pas ?
--====================================================================================
function ShowNoPhoneWarning ()
end

--[[
  Ouverture du téphone lié a un item
  Un solution ESC basé sur la solution donnée par HalCroves
  https://forum.fivem.net/t/tutorial-for-chrono-with-call-and-job-message-other/177904
--]]
local CurrentAction              = nil    --====================================================================================
local CurrentActionMsg           = ''   --  Kontrollera om spelaren har en telefon
local CurrentActionData          = {}   --  Callback true or false
local CurrentDispatchRequestId   = -1

ESX = nil
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


function hasPhone (cb)
  
  if (ESX == nil) then return cb(0) end
  --Citizen.Wait(100) -- Testar Wait (Lagg)
  ESX.TriggerServerCallback('chrono:getItemAmount', function(qtty)
    cb(qtty > 0)
  end, 'phone')
end
function ShowNoPhoneWarning () 
  if (ESX == nil) then return end
  exports['mythic_notify']:SendAlert('inform', 'Du har ingen telefon.', { ['background-color'] = '#b00000', ['color'] = '#fff' })
end



--====================================================================================
--  
--====================================================================================

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if takePhoto ~= true then
      if IsControlJustPressed(1, KeyOpenClose) then
        hasPhone(function (hasPhone)
          if hasPhone == true then
            TooglePhone()
          else
            ShowNoPhoneWarning()
          end
        end)
      end
      if menuIsOpen == true then
        for _, value in ipairs(KeyToucheCloseEvent) do
          if IsControlJustPressed(1, value.code) then
            SendNUIMessage({keyUp = value.event})
          end
        end
        if useMouse == true and hasFocus == ignoreFocus then
          local nuiFocus = not hasFocus
          SetNuiFocus(nuiFocus, nuiFocus)
          hasFocus = nuiFocus
        elseif useMouse == false and hasFocus == true then
          SetNuiFocus(false, false)
          hasFocus = false
        end
      else
        if hasFocus == true then
          SetNuiFocus(false, false)
          hasFocus = false
        end
      end
    end
  end
end)


RegisterNetEvent('chrono:setEnableApp')
AddEventHandler('chrono:setEnableApp', function(appName, enable)
  SendNUIMessage({event = 'setEnableApp', appName = appName, enable = enable })
end)

--Dispatch--
RegisterNetEvent('qalle:job')
AddEventHandler('qalle:job', function(number, message, position, caller, dispatchRequestId)

  local playerPed   = GetPlayerPed(-1)
  dispatchRequestId = dispatchRequestId
  if number == 'police' then
    numbertext = 'Polisen'
  elseif number == 'ambulance' then
    numbertext = 'Akuten'
  elseif number == 'drug' then
    numbertext = 'Drog Larm'
  elseif number == 'mecano' then
    numbertext = 'Mekaniker'
  elseif number == 'cardealer' then
    numbertext = 'Bilfirman'
  elseif number == 'taxi' then
    numbertext = 'Uber'
    elseif number == 'bennys' then
    numbertext = 'Bennys'  
    elseif number == 'Securitas' then
    numbertext = 'Securitas'  
  end

  if number == tonumber(number) then
    exports['mythic_notify']:SendAlert('success', 'Du fick ett meddelande!', 4500 , { ['background-color'] = '#007ecc', ['color'] = '#fff' })
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(250)
    job = number
  elseif number ~= tonumber(number) then

    exports['mythic_notify']:SendAlert('success', "[Till: " .. numbertext .. " Från: " .. caller .. "] " .. message, 10000, { ['background-color'] = '#007ecc', ['color'] = '#fff' })
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(250)
    job = ''
  elseif number == 'drug' then
    ESX.ShowNotification(numbertext .. ': ' .. message)
  end

  print("dispatch: " .. tostring(dispatchRequestId))
  if (dispatchRequestId) then

    CurrentAction            = 'dispatch'
    CurrentActionMsg         = exports['mythic_notify']:SendAlert('success', numbertext .. ' - Tryck [Y] för svara på samtalet', 10000, { ['background-color'] = '#007ecc', ['color'] = '#fff' })

    CurrentDispatchRequestId = dispatchRequestId

    CurrentActionData = {
      phoneNumber = number,
      message     = message,
      position    = position,
      actions     = actions,
      job         = job,
      caller = caller
    }

  end
end)

Citizen.CreateThread(function()

  SetNuiFocus(false)

  while true do

  Citizen.Wait(1)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, Keys['Y']) then

        if CurrentAction == 'dispatch' then

          if CurrentActionData.phoneNumber == 'drug' then
            SetNewWaypoint(CurrentActionData.position.x,  CurrentActionData.position.y)
          elseif CurrentActionData.phoneNumber == 'police' then
            ESX.TriggerServerCallback('chrono:getIdentity', function (identity)
            TriggerServerEvent('chrono:stopDispatch2', CurrentDispatchRequestId)
              SetNewWaypoint(CurrentActionData.position.x,  CurrentActionData.position.y)
              TriggerServerEvent('chrono:sendMessage', CurrentActionData.caller, 'SOS Operatör: Polis är på väg mot din angivna larmpostion. Vänligen invänta ingripande patrull för att ange uppgifter. Vid personskador, larma ambulans och försäkra dig om att personen har puls och fria luftvägar. Om inte, påbörja hjärt- och lungräddning!')
            end)
            elseif CurrentActionData.phoneNumber == 'ambulance' then
              ESX.TriggerServerCallback('chrono:getIdentity', function (identity)
                TriggerServerEvent('chrono:stopDispatch2', CurrentDispatchRequestId)
              SetNewWaypoint(CurrentActionData.position.x,  CurrentActionData.position.y)
              TriggerServerEvent('chrono:sendMessage', CurrentActionData.caller, 'SOS Operatör: Ambulans är på väg mot din angivna larmposition. Vid skada på andra part, kontrollera så personen har puls och fria luftvägar. Om inte, påbörja hjärt- och lungräddning!') 
              end)
            elseif CurrentActionData.phoneNumber == 'taxi' or CurrentActionData.phoneNumber == 'mecano' or CurrentActionData.phoneNumber == 'Securitas' then
              ESX.TriggerServerCallback('chrono:getIdentity', function (identity)
                TriggerServerEvent('chrono:stopDispatch', CurrentDispatchRequestId)
                TriggerServerEvent('chrono:sendMessage', CurrentActionData.caller, identity.firstname .. ' kommer så fort som möjligt, var god vänta på platsen.')
                SetNewWaypoint(CurrentActionData.position.x,  CurrentActionData.position.y)
              end)
               elseif CurrentActionData.phoneNumber == 'cardealer' or CurrentActionData.phoneNumber == 'bennys' then
              ESX.TriggerServerCallback('chrono:getIdentity', function (identity)
                TriggerServerEvent('chrono:stopDispatch', CurrentDispatchRequestId)
                TriggerServerEvent('chrono:sendMessage', CurrentActionData.caller, identity.firstname .. ' har läst ditt meddelande och återkopplar så snart som möjligt.')
                SetNewWaypoint(CurrentActionData.position.x,  CurrentActionData.position.y)
              end)
            else

            end

          CurrentAction = nil

        end

      end
    end

  end
end)



--====================================================================================
--  Gestion des appels fixe
--====================================================================================
function startFixeCall (fixeNumber)
  local number = ''
  DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 10)
  while (UpdateOnscreenKeyboard() == 0) do
    DisableAllControlActions(0);
    Wait(0);
  end
  if (GetOnscreenKeyboardResult()) then
    number =  GetOnscreenKeyboardResult()
  end
  if number ~= '' then
    TriggerEvent('chrono:autoCall', number, {
      useNumber = fixeNumber
    })
    PhonePlayCall(true)
  end
end

function TakeAppel (infoCall)
  TriggerEvent('chrono:autoAcceptCall', infoCall)
end

RegisterNetEvent("chrono:notifyFixePhoneChange")
AddEventHandler("chrono:notifyFixePhoneChange", function(_PhoneInCall)
  PhoneInCall = _PhoneInCall
end)

--[[
  Affiche les imformations quant le joueurs est proche d'un fixe
--]]
function showFixePhoneHelper (coords)
  for number, data in pairs(FixePhone) do
    local dist = GetDistanceBetweenCoords(
      data.coords.x, data.coords.y, data.coords.z,
      coords.x, coords.y, coords.z, 1)
    if dist <= 2.0 then
      SetTextComponentFormat("STRING")
      AddTextComponentString("~g~" .. data.name .. ' ~o~' .. number .. '~n~~INPUT_PICKUP~~w~ för att använda')
      DisplayHelpTextFromStringLabel(0, 0, 0, -1)
      if IsControlJustPressed(1, KeyTakeCall) then
        startFixeCall(number)
      end
      break
    end
  end
end
 

Citizen.CreateThread(function ()
  local mod = 0
  while true do 
    local playerPed   = PlayerPedId()
    local coords      = GetEntityCoords(playerPed)
    local inRangeToActivePhone = false
    local inRangedist = 0
    for i, _ in pairs(PhoneInCall) do 
        local dist = GetDistanceBetweenCoords(
          PhoneInCall[i].coords.x, PhoneInCall[i].coords.y, PhoneInCall[i].coords.z,
          coords.x, coords.y, coords.z, 1)
        if (dist <= soundDistanceMax) then
          DrawMarker(1, PhoneInCall[i].coords.x, PhoneInCall[i].coords.y, PhoneInCall[i].coords.z,
              0,0,0, 0,0,0, 0.1,0.1,0.1, 0,255,0,255, 0,0,0,0,0,0,0)
          inRangeToActivePhone = true
          inRangedist = dist
          if (dist <= 1.5) then 
            SetTextComponentFormat("STRING")
            AddTextComponentString("~INPUT_PICKUP~ Décrocher")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(1, KeyTakeCall) then
              PhonePlayCall(true)
              TakeAppel(PhoneInCall[i])
              PhoneInCall = {}
              StopSoundJS('ring2.ogg')
            end
          end
          break
        end
    end
    if inRangeToActivePhone == false then
      showFixePhoneHelper(coords)
    end
    if inRangeToActivePhone == true and currentPlaySound == false then
      PlaySoundJS('ring2.ogg', 0.2 + (inRangedist - soundDistanceMax) / -soundDistanceMax * 0.8 )
      currentPlaySound = true
    elseif inRangeToActivePhone == true then
      mod = mod + 1
      if (mod == 15) then
        mod = 0
        SetSoundVolumeJS('ring2.ogg', 0.2 + (inRangedist - soundDistanceMax) / -soundDistanceMax * 0.8 )
      end
    elseif inRangeToActivePhone == false and currentPlaySound == true then
      currentPlaySound = false
      StopSoundJS('ring2.ogg')
    end
    Citizen.Wait(0)
  end
end)


function PlaySoundJS (sound, volume)
  SendNUIMessage({ event = 'playSound', sound = sound, volume = volume })
end

function SetSoundVolumeJS (sound, volume)
  SendNUIMessage({ event = 'setSoundVolume', sound = sound, volume = volume})
end

function StopSoundJS (sound)
  SendNUIMessage({ event = 'stopSound', sound = sound})
end












RegisterNetEvent("chrono:forceOpenPhone")
AddEventHandler("chrono:forceOpenPhone", function(_myPhoneNumber)
  if menuIsOpen == false then
    TooglePhone()
  end
end)
 
--====================================================================================
--  Events
--====================================================================================
RegisterNetEvent("chrono:myPhoneNumber")
AddEventHandler("chrono:myPhoneNumber", function(_myPhoneNumber)
  myPhoneNumber = _myPhoneNumber
  SendNUIMessage({event = 'updateMyPhoneNumber', myPhoneNumber = myPhoneNumber})
end)

RegisterNetEvent("chrono:contactList")
AddEventHandler("chrono:contactList", function(_contacts)
  SendNUIMessage({event = 'updateContacts', contacts = _contacts})
  contacts = _contacts
end)

RegisterNetEvent("chrono:allMessage")
AddEventHandler("chrono:allMessage", function(allmessages)
  SendNUIMessage({event = 'updateMessages', messages = allmessages})
  messages = allmessages
end)

RegisterNetEvent("chrono:getBourse")
AddEventHandler("chrono:getBourse", function(bourse)
  SendNUIMessage({event = 'updateBourse', bourse = bourse})
end)

RegisterNetEvent("chrono:receiveMessage")
AddEventHandler("chrono:receiveMessage", function(message)
  -- SendNUIMessage({event = 'updateMessages', messages = messages})
  SendNUIMessage({event = 'newMessage', message = message})
  table.insert(messages, message)
  if message.owner == 0 then
    local text = 'Nytt meddelande'
    if ShowNumberNotification == true then
      text = 'Nytt meddelande från '.. message.transmitter
      for _,contact in pairs(contacts) do
        if contact.number == message.transmitter then
          text = 'Nytt meddelande från '.. contact.display
          break
        end
      end
    end
    --SetNotificationTextEntry("STRING")
    --AddTextComponentString(text)
    exports['mythic_notify']:SendAlert('success', text, 5000, { ['background-color'] = '#007ecc', ['color'] = '#fff' })
    DrawNotification(false, false)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
  end
end)

--====================================================================================
--  Function client | Contacts
--====================================================================================
function addContact(display, num) 
    TriggerServerEvent('chrono:addContact', display, num)
end

function deleteContact(num) 
    TriggerServerEvent('chrono:deleteContact', num)
end
--====================================================================================
--  Function client | Messages
--====================================================================================
function sendMessage(num, message)
  TriggerServerEvent('chrono:sendMessage', num, message)
end

function deleteMessage(msgId)
  TriggerServerEvent('chrono:deleteMessage', msgId)
  for k, v in ipairs(messages) do 
    if v.id == msgId then
      table.remove(messages, k)
      SendNUIMessage({event = 'updateMessages', messages = messages})
      return
    end
  end
end

function deleteMessageContact(num)
  TriggerServerEvent('chrono:deleteMessageNumber', num)
end

function deleteAllMessage()
  TriggerServerEvent('chrono:deleteAllMessage')
end

function setReadMessageNumber(num)
  TriggerServerEvent('chrono:setReadMessageNumber', num)
  for k, v in ipairs(messages) do 
    if v.transmitter == num then
      v.isRead = 1
    end
  end
end

function requestAllMessages()
  TriggerServerEvent('chrono:requestAllMessages')
end

function requestAllContact()
  TriggerServerEvent('chrono:requestAllContact')
end



--====================================================================================
--  Function client | Appels
--====================================================================================
local aminCall = false
local inCall = false

RegisterNetEvent("chrono:waitingCall")
AddEventHandler("chrono:waitingCall", function(infoCall, initiator)
  SendNUIMessage({event = 'waitingCall', infoCall = infoCall, initiator = initiator})
  if initiator == true then
    PhonePlayCall()
    if menuIsOpen == false then
      TooglePhone()
    end
  end
end)

RegisterNetEvent("chrono:acceptCall")
AddEventHandler("chrono:acceptCall", function(infoCall, initiator)
  if inCall == false and USE_RTC == false then
    inCall = true
    exports.tokovoip_script:addPlayerToRadio(infoCall.id + 120)
    TokoVoipID = infoCall.id + 120 NetworkSetVoiceChannel(0xE036A705F989E049)
  end
  if menuIsOpen == false then 
    TooglePhone()
  end
  PhonePlayCall()
  SendNUIMessage({event = 'acceptCall', infoCall = infoCall, initiator = initiator})
end)

RegisterNetEvent("chrono:rejectCall")
AddEventHandler("chrono:rejectCall", function(infoCall)
  if inCall == true then
    inCall = false
    Citizen.InvokeNative(0xE036A705F989E049)
    exports.tokovoip_script:removePlayerFromRadio(TokoVoipID)
  TokoVoipID = nil
  end
  PhonePlayText()
  SendNUIMessage({event = 'rejectCall', infoCall = infoCall})
end)


RegisterNetEvent("chrono:historiqueCall")
AddEventHandler("chrono:historiqueCall", function(historique)
  SendNUIMessage({event = 'historiqueCall', historique = historique})
end)


function startCall (phone_number, rtcOffer, extraData)
  TriggerServerEvent('chrono:startCall', phone_number, rtcOffer, extraData)
end

function acceptCall (infoCall, rtcAnswer)
  TriggerServerEvent('chrono:acceptCall', infoCall, rtcAnswer)
end

function rejectCall(infoCall)
  TriggerServerEvent('chrono:rejectCall', infoCall)
end

function ignoreCall(infoCall)
  TriggerServerEvent('chrono:ignoreCall', infoCall)
end

function requestHistoriqueCall() 
  TriggerServerEvent('chrono:getHistoriqueCall')
end

function appelsDeleteHistorique (num)
  TriggerServerEvent('chrono:appelsDeleteHistorique', num)
end

function appelsDeleteAllHistorique ()
  TriggerServerEvent('chrono:appelsDeleteAllHistorique')
end
  

--====================================================================================
--  Event NUI - Appels
--====================================================================================

RegisterNUICallback('startCall', function (data, cb)
  startCall(data.numero, data.rtcOffer, data.extraData)
  cb()
end)

RegisterNUICallback('acceptCall', function (data, cb)
  acceptCall(data.infoCall, data.rtcAnswer)
  cb()
end)
RegisterNUICallback('rejectCall', function (data, cb)
  rejectCall(data.infoCall)
  cb()
end)

RegisterNUICallback('ignoreCall', function (data, cb)
  ignoreCall(data.infoCall)
  cb()
end)

RegisterNUICallback('notififyUseRTC', function (use, cb)
  USE_RTC = use
  if USE_RTC == true and inCall == true then
    inCall = false
    Citizen.InvokeNative(0xE036A705F989E049)
    exports.tokovoip_script:removePlayerFromRadio(TokoVoipID)
    TokoVoipID = nil
  end
  cb()
end)


RegisterNUICallback('onCandidates', function (data, cb)
  TriggerServerEvent('chrono:candidates', data.id, data.candidates)
  cb()
end)

RegisterNetEvent("chrono:candidates")
AddEventHandler("chrono:candidates", function(candidates)
  SendNUIMessage({event = 'candidatesAvailable', candidates = candidates})
end)



RegisterNetEvent('chrono:autoCall')
AddEventHandler('chrono:autoCall', function(number, extraData)
  if number ~= nil then
    SendNUIMessage({ event = "autoStartCall", number = number, extraData = extraData})
  end
end)

RegisterNetEvent('chrono:autoCallNumber')
AddEventHandler('chrono:autoCallNumber', function(data)
  TriggerEvent('chrono:autoCall', data.number)
end)

RegisterNetEvent('chrono:autoAcceptCall')
AddEventHandler('chrono:autoAcceptCall', function(infoCall)
  SendNUIMessage({ event = "autoAcceptCall", infoCall = infoCall})
end)





























































--====================================================================================
--  Gestion des evenements NUI
--==================================================================================== 
RegisterNUICallback('log', function(data, cb)
  print(data)
  cb()
end)
RegisterNUICallback('focus', function(data, cb)
  cb()
end)
RegisterNUICallback('blur', function(data, cb)
  cb()
end)
RegisterNUICallback('reponseText', function(data, cb)
  local limit = data.limit or 255
  local text = data.text or ''
  
  DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", text, "", "", "", limit)
  while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0);
      Wait(0);
  end
  if (GetOnscreenKeyboardResult()) then
      text = GetOnscreenKeyboardResult()
  end
  cb(json.encode({text = text}))
end)
--====================================================================================
--  Event - Messages
--====================================================================================
RegisterNUICallback('getMessages', function(data, cb)
  cb(json.encode(messages))
end)
RegisterNUICallback('sendMessage', function(data, cb)
  if data.message == '%pos%' then
    local myPos = GetEntityCoords(PlayerPedId())
    data.message = 'GPS: ' .. myPos.x .. ', ' .. myPos.y
  end
  TriggerServerEvent('chrono:sendMessage', data.phoneNumber, data.message)
end)
RegisterNUICallback('deleteMessage', function(data, cb)
  deleteMessage(data.id)
  cb()
end)
RegisterNUICallback('deleteMessageNumber', function (data, cb)
  deleteMessageContact(data.number)
  cb()
end)
RegisterNUICallback('deleteAllMessage', function (data, cb)
  deleteAllMessage()
  cb()
end)
RegisterNUICallback('setReadMessageNumber', function (data, cb)
  setReadMessageNumber(data.number)
  cb()
end)
--====================================================================================
--  Event - Contacts
--====================================================================================
RegisterNUICallback('addContact', function(data, cb) 
  TriggerServerEvent('chrono:addContact', data.display, data.phoneNumber)
end)
RegisterNUICallback('updateContact', function(data, cb)
  TriggerServerEvent('chrono:updateContact', data.id, data.display, data.phoneNumber)
end)
RegisterNUICallback('deleteContact', function(data, cb)
  TriggerServerEvent('chrono:deleteContact', data.id)
end)
RegisterNUICallback('getContacts', function(data, cb)
  cb(json.encode(contacts))
end)
RegisterNUICallback('setGPS', function(data, cb)
  SetNewWaypoint(tonumber(data.x), tonumber(data.y))
  cb()
end)

-- Add security for event (leuit#0100)
RegisterNUICallback('callEvent', function(data, cb)
  local eventName = data.eventName or ''
  if string.match(eventName, 'chrono') then
    if data.data ~= nil then 
      TriggerEvent(data.eventName, data.data)
    else
      TriggerEvent(data.eventName)
    end
  else
    print('Event not allowed')
  end
  cb()
end)
RegisterNUICallback('useMouse', function(um, cb)
  useMouse = um
end)
RegisterNUICallback('deleteALL', function(data, cb)
  TriggerServerEvent('chrono:deleteALL')
  cb()
end)



function TooglePhone() 
  menuIsOpen = not menuIsOpen
  SendNUIMessage({show = menuIsOpen})
  if menuIsOpen == true then 
    PhonePlayIn()
  else
    PhonePlayOut()
  end
end
RegisterNUICallback('faketakePhoto', function(data, cb)
  menuIsOpen = false
  SendNUIMessage({show = false})
  cb()
  TriggerEvent('camera:open')
end)

RegisterNUICallback('closePhone', function(data, cb)
  menuIsOpen = false
  SendNUIMessage({show = false})
  PhonePlayOut()
  cb()
end)


RegisterNetEvent('chrono:stopDispatch')
AddEventHandler('chrono:stopDispatch', function(dispatchRequestId, playerName, policeDispatch)
  if CurrentDispatchRequestId == dispatchRequestId then
    CurrentAction = nil
    --ESX.ShowNotification('~b~'.. playerName.firstname .. ' tar det samtalet')
    exports['mythic_notify']:SendAlert('success', playerName.firstname .. " tar det samtalet. ", 3500, { ['background-color'] = '#119100', ['color'] = '#fff' })
  end
end)
RegisterNetEvent('chrono:stopDispatch2')
AddEventHandler('chrono:stopDispatch2', function(dispatchRequestId, playerName, policeDispatch)
  if CurrentDispatchRequestId == dispatchRequestId then
    --ESX.ShowNotification('~b~'.. playerName.firstname .. '~w~ åker på det larmet.')
    exports['mythic_notify']:SendAlert('success', playerName.firstname .. " åker på det larmet. ", 3500, { ['background-color'] = '#119100', ['color'] = '#fff' })
  end
end)


----------------------------------
---------- GESTION APPEL ---------
----------------------------------
RegisterNUICallback('appelsDeleteHistorique', function (data, cb)
  appelsDeleteHistorique(data.numero)
  cb()
end)
RegisterNUICallback('appelsDeleteAllHistorique', function (data, cb)
  appelsDeleteAllHistorique(data.infoCall)
  cb()
end)


----------------------------------
---------- GESTION VIA WEBRTC ----
----------------------------------
AddEventHandler('onClientResourceStart', function(res)
  DoScreenFadeIn(300)
  if res == "chrono" then
      TriggerServerEvent('chrono:allUpdate')
  end
end)


RegisterNUICallback('setIgnoreFocus', function (data, cb)
  ignoreFocus = data.ignoreFocus
  cb()
end)















RegisterNUICallback('takePhoto', function(data, cb)
  CreateMobilePhone(1)
  CellCamActivate(true, true)
  takePhoto = true
  Citizen.Wait(0)
  if hasFocus == true then
    SetNuiFocus(false, false)
    hasFocus = false
  end
  while takePhoto do
    Citizen.Wait(0)

    if IsControlJustPressed(1, 27) then -- Toogle Mode
      frontCam = not frontCam
      CellFrontCamActivate(frontCam)
    elseif IsControlJustPressed(1, 177) then -- CANCEL
      DestroyMobilePhone()
      CellCamActivate(false, false)
      cb(json.encode({ url = nil }))
      takePhoto = false
      break
    elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
      exports['screenshot-basic']:requestScreenshotUpload(data.url, data.field, function(data)
        local resp = json.decode(data)
        DestroyMobilePhone()
        CellCamActivate(false, false)
        cb(json.encode({ url = resp.files[1].url }))   
      end)
      takePhoto = false
    end
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(8)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(6)
    HideHudComponentThisFrame(19)
    HideHudAndRadarThisFrame()
  end
  Citizen.Wait(1000)
  PhonePlayAnim('text', false, true)
end)