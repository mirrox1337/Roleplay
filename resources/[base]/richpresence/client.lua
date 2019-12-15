Citizen.CreateThread(function()

    while ESX == nil do
      Citizen.Wait(200)
      TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('getIdentity', function(identity)
        while true do
            Citizen.Wait(0)

            -- Uppdaterad Rich Presence av chrono

            SetDiscordAppId(655782756000989197)
            SetDiscordRichPresenceAsset('logo')
            SetDiscordRichPresenceAssetText ('http://www.ROLEPLAY.nu')
            SetDiscordRichPresenceAssetSmallText ('http:/www.ROLEPLAY.nu')

            local playerCount = #GetActivePlayers()
            local playerName = identity.firstname .. ' ' .. identity.lastname
            local maxPlayerSlots = "64"

            SetRichPresence(string.format("%s/%s - %s", playerCount, maxPlayerSlots, playerName))

            Citizen.Wait(60000)
        end
    end)
end)