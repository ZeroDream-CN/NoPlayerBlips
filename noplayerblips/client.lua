--- Configure these options:

--- min_players_online: If the number of players online drops below this number, blips will no longer be hidden.
--- set this to 0 to disable this feature.
local min_players_online = 0 -- (default: 0)

--- blip_display_type: possible values:
-- 1: hide blips completely.
-- 2: show blips on both the minimap/radar and in the pause menu.
-- 3: show blips in the pause menu only (hidden on minimap/radar).
local blip_display_type = 1 -- (default: 1)

--- alternative_blip_display_type: this display type will be used if the player is allowed to see blips.
--- possible values are:
-- 2: show blips on both the minimap/radar and in the pause menu.
-- 3: show blips in the pause menu only (hidden on minimap/radar).
local alternative_blip_display_type = 2 -- (default: 2)




--- Don't touch this code
local god = false

Citizen.CreateThread(function()
    TriggerServerEvent('CheckPermissions')
    while true do
        Citizen.Wait(0) -- Wait 0 seconds to prevent crashing.
        print(tostring(god))
        if not god and NetworkGetNumConnectedPlayers() >= min_players_online then
            print('hide')
            for x=0,32 do
                local entityblip = GetBlipFromEntity(GetPlayerPed(x))
                if DoesBlipExist(entityblip) then
                    SetBlipShowCone(blip, false)
                    SetBlipDisplay(entityblip, blip_display_type)
                end
            end
        else
            print('show')
            for x=0,32 do
                local entityblip = GetBlipFromEntity(GetPlayerPed(x))
                if DoesBlipExist(entityblip) then
                    SetBlipDisplay(entityblip, alternative_blip_display_type)
                end
            end
        end
    end
end)

RegisterNetEvent('SetGod')
AddEventHandler('SetGod', function()
    god = true
end)

