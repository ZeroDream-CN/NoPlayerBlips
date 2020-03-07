RegisterServerEvent('NoPlayerBlips:CheckPermissions')
AddEventHandler('NoPlayerBlips:CheckPermissions', function()
    if IsPlayerAceAllowed(source, "npb.god") then
        TriggerClientEvent('NoPlayerBlips:SetGod', source)
    end
end)
