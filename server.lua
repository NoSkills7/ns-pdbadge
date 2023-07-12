
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.GiveBadgeCommand, "Give a police Badge (Commissioner Only)", {}, false, function(source)
  local Player = QBCore.Functions.GetPlayer(source)
  if Player.PlayerData.job.name == 'police' and Player.PlayerData.job.grade.level >= Config.MinimumRank then
  TriggerClientEvent('ns-pdbadge:client:GiveCopBadge', source)
  end
end)


QBCore.Functions.CreateUseableItem('pdbadge', function(source, item)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local PlayerPed = GetPlayerPed(src)
  local PlayerCoords = GetEntityCoords(PlayerPed)
  TriggerClientEvent('ns-pdbadge:client:BadgeAnimation', src)
  local slot = exports.ox_inventory:GetSlot(source, item.slot)
  local text = slot.metadata.type
  local text2 = slot.metadata.description
  for _, v in pairs(QBCore.Functions.GetPlayers()) do
      local TargetPed = GetPlayerPed(v)
      local dist = #(PlayerCoords - GetEntityCoords(TargetPed))
      if dist < 3.0 and PlayerPed ~= TargetPed then
          TriggerClientEvent('QBCore:Notify', src, "You showed your Badge")
          if Config.UseOkOkChat then
            TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgba(42, 42, 42, 0.9) 0%, rgba(24, 49, 196, 0.9) 100%)', '#35dbc2', 'fas fa-siren', 'Police Badge', text, text2, v)
            break
          else
             TriggerClientEvent('chat:addMessage', v, {
              color = { 255, 255, 255 }, -- Message color in RGB format
              multiline = true, -- Enable multiline message if needed
              args = { text, text2 } -- Message content
            })
            break
          end
      end
  end
end)

RegisterServerEvent('qb-policejob:server:GiveOfficerBadge', function(name, callsign, rank)
  local src = source
  local department = 'LSPD'
  local metadata = {
      type = string.format('%s ', department),
      description = string.format('Officer: %s  \nCallsign: %s  \nRank: %s',
      name, callsign, rank)
  }
  if exports.ox_inventory:CanCarryItem(src, 'pdbadge', 1) then
      exports.ox_inventory:AddItem(src, 'pdbadge', 1, metadata)
  end
end)