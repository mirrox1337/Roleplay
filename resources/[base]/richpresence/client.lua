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

            SetDiscordAppId(655792767292669982)
            SetDiscordRichPresenceAsset('dev')
            SetDiscordRichPresenceAssetText ('Mirrox Dev Server')
            SetDiscordRichPresenceAssetSmallText ('Mirrox Dev Server')

            local playerCount = #GetActivePlayers()
            local playerName = identity.firstname .. ' ' .. identity.lastname
            local maxPlayerSlots = "64"

            SetRichPresence(string.format("http://ROLEPLAY.nu"))

            Citizen.Wait(60000)
        end
    end)
end)