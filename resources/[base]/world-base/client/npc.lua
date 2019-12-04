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

-- inga npc snutar
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)
    end
end)