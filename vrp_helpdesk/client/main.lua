vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_helpdesk")

local show = false
local cooldown = 0

-- Open menu
function openGui(cases)
  if show == false then
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        cases = cases
      }
    )
  end
end

-- Close menu
function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

-- Events
RegisterNetEvent("vrp_helpdesk:openGui")
AddEventHandler("vrp_helpdesk:openGui",function()
    if cooldown > 0 then
      TriggerEvent("Notify","importante","Por favor espere <b>"..cooldown.." segundos</b>, para abrir outro ticket.") 
    else
      cooldown = Config.AntiSpamCooldown
      openGui()
    end
  end
)

RegisterNetEvent("vrp_helpdesk:openCase")
AddEventHandler("vrp_helpdesk:openCase",function(case,replies,options)
    if show == true then
      SendNUIMessage(
        {
          openCase = true,
          case = case,
          replies = replies, 
          options = options
        }
      )
    end
  end
)

RegisterNetEvent("vrp_helpdesk:showMyCases")
AddEventHandler("vrp_helpdesk:showMyCases",function(cases,options)
    if show == true then
      SendNUIMessage(
        {
          showMyCases = true,
          cases = cases, 
          options = options
        }
      )
    end
  end
)

RegisterNetEvent("vrp_helpdesk:showSupportCases")
AddEventHandler("vrp_helpdesk:showSupportCases",function(cases,options)
    if show == true then
      SendNUIMessage(
        {
          showSupportCases = true,
          cases = cases, 
          options = options
        }
      )
    end
  end
)

-- NUI callbacks
RegisterNUICallback(
  "close",
  function(data)
    closeGui()
  end
)

RegisterNUICallback("getCases",function()
    TriggerServerEvent("vrp_helpdesk:getCases")
  end
)

RegisterNUICallback("getCase",function(data)
    TriggerServerEvent("vrp_helpdesk:getCase", data.id)
  end
)

RegisterNUICallback("applyReply",function(data)
    TriggerServerEvent("vrp_helpdesk:applyReply", data.message, data.case_id, data.replyid)
  end
)

RegisterNUICallback("closeCase",function(data)
    TriggerServerEvent("vrp_helpdesk:closeCase", data.case_id)
  end
)

RegisterNUICallback("deleteCase",function(data)
    TriggerServerEvent("vrp_helpdesk:deleteCase", data.case_id)
  end
)

RegisterNUICallback("newCase",function(data)
    TriggerServerEvent("vrp_helpdesk:newCase", data.title, data.message)
  end
)

RegisterNUICallback("getSupportCases",function()
    TriggerServerEvent("vrp_helpdesk:getSupportCases")
  end
)

RegisterNUICallback("gotoPlayer",function(data)
    TriggerServerEvent("vrp_helpdesk:gotoPlayer", data.targetID)
  end
)

-- Command handler
RegisterCommand(Config.Command,function(source,args)
    TriggerEvent("vrp_helpdesk:openGui")
  end
)

AddEventHandler("onResourceStop",function(resource)
    if resource == GetCurrentResourceName() then
      closeGui()
    end
  end
)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    if cooldown > 0 then 
      cooldown = cooldown - 1
    end
  end
end)