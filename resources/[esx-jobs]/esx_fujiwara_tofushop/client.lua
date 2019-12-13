--Copyright ZAUB1
--N'hesitez pas a rejoindre mon discord : https://discord.gg/yFuSEGj
--Et a me contacter directement pour tout bug ou suggestions

--ESX INIT--

ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)




local nbPizza = 0
--CONFIGURATION--

local tofu = { x = 359.3, y = 326.57, z = 103.88722229004} --Configuration marker prise de service
local pizzeriafin = { x = 366.66659545898, y = 331.70611572266, z = 103.50541687012} --Configuration marker fin de service
local spawnfaggio = { x = 366.66659545898, y = 331.70611572266, z = 102.50541687012 } --Configuration du point de spawn du faggio

local livpt = { --Configuration des points de livraisons (repris ceux de Maykellll1 / NetOut)
[1] = {name = "Vinewood Hills",     x = -1218.81, y = 665.49, z = 144.53},
[2] = {name = "Vinewood Hills",     x = -1337.35, y = 606.14, z = 134.38},
[3] = {name = "Rockford Hills",     x = -1051.95, y = 431.77, z = 77.06 },
[4] = {name = "Rockford Hills",     x = -902.46, y = 191.52, z = 69.45 },
[5] = {name = "Rockford Hills",     x = -23.8,  y = -23.6, z = 73.25 },
[6] = {name = "Dilton Drive",       x = -34.16,  y = 347.95, z = 114.0 },
[7] = {name = "Hawick Avenue",      x = -362.15,    y = 57.33, z = 54.43 },
[8] = {name = "Hawick Avenue",      x = 414.95,  y = -217.18, z = 59.91},
[9] = {name = "Hawick Avenue",      x = 418.58,  y = -207.29, z = 59.91},
[10] ={name = "Bouievard",          x = -273.75,   y = 28.39, z = 54.75},
[11] ={name = "Lake Vinewood Drive",  x = 228.72, y = 765.69, z = 204.98},
[12] ={name = "Milton Road",        x = -658.51, y = 886.49, z = 229.25},
[13] ={name = "Milton Road",        x = -494.33, y = 795.94, z = 184.34},
[14] ={name = "Milton Road",        x = -520.7, y = 594.17, z = 120.84},
[15] ={name = "Kimble Hill",        x = -445.93, y = 686.22, z = 153.12},
[16] ={name = "Kimble Hill",        x = -476.66, y = 647.65, z = 144.39},
[17] ={name = "Normandy Drive",     x = -564.36, y = 684.62, z = 146.63},
[18] ={name = "Stonia",             x = -949.31, y = 196.64, z = 67.39},
[19] ={name = "Caesars Place",      x = -888.26, y = 42.62, z = 49.15},
[20] ={name = "Caesars Place",      x = -896.38, y = -4.96, z = 43.8},
[21] ={name = "The Epsilon Program",      x = -698.66, y = 46.97, z = 44.03},
[22] ={name = "Power Street",      x = 292.82, y = -162.71, z = 64.62},
}

local blips = {
  {title="Fujiwara Tofu", colour=4, id=88, x = 355.16174316406, y = 331.60290527344, z = 116.34196472168}, --Configuration du point sur la carte
}

local coefflouze = 0.1 --Coeficient multiplicateur qui en fonction de la distance definit la paie

--INIT--

local isInJobPizz = false
local livr = 0
local plateab = "Fujiwara"
local isToHouse = false
local isToPizzaria = false
local paie = 0

local leverans = 0
local pourboire = 0
local posibilidad = 0
local px = 0
local py = 0
local pz = 0

--THREADS--

Citizen.CreateThread(function() --Thread d'ajout du point de la tofu sur la carte

  for _, info in pairs(blips) do

    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end

end)

Citizen.CreateThread(function() --Thread lancement + livraison depuis le marker vert
  while true do

    Citizen.Wait(0)

    if isInJobPizz == false then

      DrawMarker(20,tofu.x,tofu.y,tofu.z, 0, 0, 0, 0, 0, 0, 1.0, 0.5, 1.0, 255, 255, 255, 150, 0, 1, 0, 0)

      if GetDistanceBetweenCoords(tofu.x, tofu.y, tofu.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Tryck på ~INPUT_CONTEXT~ för att börja leverera ~b~Tofu",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
            notif = true
            isInJobPizz = true
            isToHouse = true
            livr = math.random(1, 22)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z
            distance = round(GetDistanceBetweenCoords(tofu.x, tofu.y, tofu.z, px,py,pz))
            paie = distance * coefflouze

            spawn_faggio()
            goliv(livpt,livr)
            nbPizza = math.random(3, 5)

            TriggerServerEvent("pizza:itemadd", nbPizza)
        end
      end
    end

    if isToHouse == true then

      destinol = livpt[livr].name

      while notif == true do

        exports['mythic_notify']:SendAlert('inform', 'Bunta Fujiwara: Leverera till ' ..destinol)

        notif = false

        i = 1
      end

      DrawMarker(20,livpt[livr].x,livpt[livr].y,livpt[livr].z, 0, 0, 0, 0, 0, 0, 1.0, 0.5, 1.0, 0, 119, 119, 50, 0, 1, 0, 0)

      if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 2 then
        HelpText("Tryck på ~INPUT_CONTEXT~ för att leverera tofu!",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then

          notif2 = true
          posibilidad = math.random(1, 10)
          afaitunepizzamin = true

          TriggerServerEvent("pizza:itemrm")
          nbPizza = nbPizza - 1

          if (posibilidad > 1) and (posibilidad < 40) then

            pourboire = math.random(10, 20)

            exports['mythic_notify']:SendAlert('success', 'Här du får en bonus för snabb leverans! : ' .. pourboire .. 'SEK')

            TriggerServerEvent("pizza:pourboire", pourboire)

          end

          RemoveBlip(liv)
          Wait(250)
          if nbPizza == 0 then
            isToHouse = false
            isToPizzaria = true
          else
            isToHouse = true
            isToPizzaria = false
            livr = math.random(1, 22)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z

            distance = round(GetDistanceBetweenCoords(tofu.x, tofu.y, tofu.z, px,py,pz))
            paie = distance * coefflouze

            goliv(livpt,livr)
          end


        end
      end
    end

    if isToPizzaria == true then

      while notif2 == true do
        SetNewWaypoint(tofu.x,tofu.y)

        exports['mythic_notify']:SendAlert('success', 'Snyggt jobbat! Åk tillbaka till Fujiwara för att få din betalning.')

        notif2 = false

      end
      DrawMarker(20,tofu.x,tofu.y,tofu.z, 0, 0, 0, 0, 0, 0, 1.0, 0.5, 1.0, 0, 119, 119, 50, 0, 1, 0, 0)

      if GetDistanceBetweenCoords(tofu.x,tofu.y,tofu.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 and afaitunepizzamin == true then
        HelpText("Tryck på ~INPUT_CONTEXT~ för att hämta ut Tofu!",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("ae86"))  then

          if IsControlJustPressed(1,38) then

            if IsInVehicle() then

              afaitunepizzamin = false

              TriggerServerEvent("pizza:leverans")

              isInJobPizz = true
              isToHouse = true
              livr = math.random(1, 22)

              px = livpt[livr].x
              py = livpt[livr].y
              pz = livpt[livr].z

              distance = round(GetDistanceBetweenCoords(tofu.x, tofu.y, tofu.z, px,py,pz))
              paie = distance * coefflouze

              goliv(livpt,livr)
              nbPizza = math.random(3, 5)

              TriggerServerEvent("pizza:itemadd", nbPizza)

            else

              notifmoto1 = true

              while notifmoto1 == true do

                exports['mythic_notify']:SendAlert('error', 'Du spillde vatten')

                notifmoto1 = false

              end
            end
          end
        else

          notifmoto2 = true

          while notifmoto2 == true do

            exports['mythic_notify']:SendAlert('error', 'Du spillde vatten')
            notifmoto2 = false

          end
        end
      end
    end
    if IsEntityDead(GetPlayerPed(-1)) then

      isInJobPizz = false
      livr = 0
      isToHouse = false
      isToPizzaria = false

      paie = 0
      px = 0
      py = 0
      pz = 0
      RemoveBlip(liv)

    end
  end
end)



Citizen.CreateThread(function() -- Thread de "fin de service" depuis le point rouge
  while true do

    Citizen.Wait(0)

    if isInJobPizz == true then

      DrawMarker(20,pizzeriafin.x,pizzeriafin.y,pizzeriafin.z, 0, 0, 0, 0, 0, 0, 1.0, 0.5, 1.0, 255, 0, 0, 50, 0, 1, 0, 0)

      if GetDistanceBetweenCoords(pizzeriafin.x, pizzeriafin.y, pizzeriafin.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Tryck på ~INPUT_CONTEXT~ för att sluta leverera ~b~Tofu",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
          TriggerServerEvent('pizza:deleteAllPizz')
          isInJobPizz = false
          livr = 0
          isToHouse = false
          isToPizzaria = false

          paie = 0
          px = 0
          py = 0
          pz = 0

          if afaitunepizzamin == true then

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )

			--exports['mythic_notify']:SendAlert('success', 'Tack för att du jobbat idag! Här får du din lön: ' .. flouzefin .. 'SEK')

            TriggerServerEvent("pizza:paiefinale", flouzefin)


            SetWaypointOff()

            afaitunepizzamin = false

          else

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )

			exports['mythic_notify']:SendAlert('success', 'Tack ändå, ha en trevlig dag')
          end
        end
      end
    end
  end
end)

--FONCTIONS--

function goliv(livpt,livr) -- Fonction d'ajout du point en fonction de la destination de livraison chosie
  liv = AddBlipForCoord(livpt[livr].x,livpt[livr].y, livpt[livr].z)
  SetBlipSprite(liv, 1)
  SetNewWaypoint(livpt[livr].x,livpt[livr].y)
end

function spawn_faggio() -- Thread spawn faggio

  Citizen.Wait(0)

  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey('ae86')

  RequestModel(vehicle)

  while not HasModelLoaded(vehicle) do
    Wait(1)
  end

  local plateJob = math.random(696, 696)
  local spawned_car = CreateVehicle(vehicle, spawnfaggio.x,spawnfaggio.y,spawnfaggio.z, 166.18, - 996.786, 25.1887, true, false)

  local plate = "Fujiwara"..plateJob

  SetVehicleNumberPlateText(spawned_car, plate)
  SetVehicleColours(spawned_car, 112, 112)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleLivery(spawned_car, 2)
  SetPedIntoVehicle(myPed, spawned_car, - 1)
  SetModelAsNoLongerNeeded(vehicle)

  Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) ) --Native qui del le vehicule
end

function IsInVehicle() --Fonction de verification de la presence ou non en vehicule du joueur
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function HelpText(text, state) --Fonction qui permet de creer les "Help Text" (Type "Appuyez sur ...")
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
