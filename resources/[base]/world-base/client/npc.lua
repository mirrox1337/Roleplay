--Inga NPC Vapen Pickups
local pedindex = {}

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false
    repeat 
        if not IsEntityDead(ped) then
                pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle)
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then
            SetPedDropsWeaponsWhenDead(peds, false) 
        end
    end
end

--Inga Vapen Pickup fr�n bilar
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)      
        RemoveAllPickupsOfType(14)
    end
end)

--Ingen dispatch
Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 15 do
			EnableDispatchService(i, false)
		end
	end
end)

--Lås på NPC bilar
Citizen.CreateThread(function()
    while true do
        Wait(100)
        local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
            local lock = GetVehicleDoorLockStatus(veh)
            if lock == 7 then
                SetVehicleDoorsLocked(veh, 2)
            end
            local pedd = GetPedInVehicleSeat(veh, -1)
            if pedd then
                SetPedCanBeDraggedOut(pedd, false)
            end
        end
    end
 end)