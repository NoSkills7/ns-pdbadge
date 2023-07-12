RegisterNetEvent('ns-pdbadge:client:GiveCopBadge', function()
    local input = lib.inputDialog('', {
        { type = 'input', label = 'Officer Name', placeholder = '' },
        { type = 'input', label = 'Officer Callsign', placeholder = '' },
        { type = 'input', label = 'Officer Rank', placeholder = '' },
    })
    TriggerServerEvent('ns-pdbadge:server:GiveOfficerBadge', input[1], input[2], input[3])
end)

RegisterNetEvent('ns-pdbadge:client:BadgeAnimation', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"idcardb"})
end)