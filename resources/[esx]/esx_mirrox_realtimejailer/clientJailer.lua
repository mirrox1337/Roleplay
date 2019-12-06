local cJ = false
local IsPlayerUnjailed = false


--ESX base

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("esx_mirrox_jailer:JailInStation")
AddEventHandler("esx_mirrox_jailer:JailInStation", function(Station, JailTime)
	jailing(Station, JailTime)
end)

function jailing(Station, JailTime)
	if cJ == true then
		return
	end
	local PlayerPed = GetPlayerPed(-1)
	if DoesEntityExist(PlayerPed) then
		
		Citizen.CreateThread(function()
			local spawnloccoords = {}
			SetJailClothes()
			spawnloccoords = SetPlayerSpawnLocationjail(Station)
			SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z )
			cJ = true
			IsPlayerUnjailed = false
			while JailTime > 0 and not IsPlayerUnjailed do
				local remainingjailseconds = JailTime/ 60
				local jailseconds =  math.floor(JailTime) % 60 
				local remainingjailminutes = remainingjailseconds / 60
				local jailminutes =  math.floor(remainingjailseconds) % 60
				local remainingjailhours = remainingjailminutes / 24
				local jailhours =  math.floor(remainingjailminutes) % 24
				local remainingjaildays = remainingjailhours / 365 
				local jaildays =  math.floor(remainingjailhours) % 365

				
				PlayerPed = GetPlayerPed(-1)
				--RemoveAllPedWeapons(PlayerPed, true)
				SetEntityInvincible(PlayerPed, true)
				if IsPedInAnyVehicle(PlayerPed, false) then
					ClearPedTasksImmediately(PlayerPed)
				end
				if JailTime % 10 == 0 then
					if JailTime % 30 == 0 then
						ESX.ShowNotification("Du har ~g~"..math.floor(jaildays).."~s~ Dagar ~g~"..math.floor(jailhours).."~s~ Timmar ~g~"..math.floor(jailminutes).."~s~ Minuter ~g~"..math.floor(jailseconds).."~s~ sekunder kvar i fängelse!.")
						--exports['mythic_notify']:DoHudText('inform', "Du har"..math.floor(jaildays).." Dagar"..math.floor(jailhours).." Timmar"..math.floor(jailminutes).." Minuter"..math.floor(jailseconds).." sekunder kvar i fängelse!.")
					end
				end
				Citizen.Wait(1000)
				local pL = GetEntityCoords(PlayerPed, true)
				local D = Vdist(spawnloccoords.x,spawnloccoords.y, spawnloccoords.z, pL['x'], pL['y'], pL['z'])
				if D > spawnloccoords.distance then -- distance#######################################################################################
					SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z)
				end
				JailTime = JailTime - 1.0
			end
			--ESX.ShowNotification("Du släpps, håll dig lugn ute! Lycka till!")
			exports['mythic_notify']:DoHudText('inform', "Du släpps, håll dig lugn ute! Lycka till!")
			GetBackOriginalClothes()
			TriggerServerEvent('esx_mirrox_jailer:UnJailplayer2')
			local outsidecoords = {}
			outsidecoords = SetPlayerSpawnLocationoutsidejail(Station)
			SetEntityCoords(PlayerPed, outsidecoords.x,outsidecoords.y,outsidecoords.z )
			cJ = false
			SetEntityInvincible(PlayerPed, false)
			TriggerEvent('esx_society:getPlayerSkin')
		end)
	end
end

function SetPlayerSpawnLocationjail(location)
	if location == 'Jail' then
		return {x=1799.8345947266,y=2489.1350097656,z=-119.02998352051, distance = 280}
	end
end

function SetPlayerSpawnLocationoutsidejail(location)
	if location == 'Jail' then
		return {x=1847.5042724609,y=2586.2209472656,z=44.672046661377}
	end
end

RegisterNetEvent("esx_mirrox_jailer:UnJail")
AddEventHandler("esx_mirrox_jailer:UnJail", function()
	IsPlayerUnjailed = true
	GetBackOriginalClothes()
end)

function SetJailClothes()
local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
     if skin.sex == 0 then
      if Config.Clothes.police.prison_wear.male ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.police.prison_wear.male)
      else
		--ESX.ShowNotification('no_outfit')
		exports['mythic_notify']:DoHudText('error', 'Ingen outfit')
      end
    else
      if Config.Clothes.police.prison_wear.female ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.police.prison_wear.female)
      else
		--ESX.ShowNotification('no_outfit')
		exports['mythic_notify']:DoHudText('error', 'Ingen outfit')
      end
    end
  end)
end

function GetBackOriginalClothes()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	  TriggerEvent('skinchanger:loadSkin', skin)
	end)
end
