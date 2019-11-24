--[[
    ADD YOUR FRAMEWORK BILLING HERE

    If the player is bill successfully, return true. If they're not, return false
]]
function BillPlayer(source, amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeBank(totalBill)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du betalade' .. totalBill ..'kr' })
    TriggerClientEvent('mythic_hospital:client:FinishServices', src)
end