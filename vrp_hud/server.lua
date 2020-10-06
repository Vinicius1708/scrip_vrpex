-- DEFAULT --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vRPhud = {}
Tunnel.bindInterface("vrp_hud",vRPhud)

RegisterServerEvent("notifySuccess:Server")
AddEventHandler("notifySuccess:Server", function(message)
  TriggerClientEvent("notifySuccess:Client", source, message)
end)

RegisterServerEvent("notifyError:Server")
AddEventHandler("notifyError:Server", function(message)
  TriggerClientEvent("notifyError:Client", source, message)
end)

RegisterServerEvent("notifyWarning:Server")
AddEventHandler("notifyWarning:Server", function(message)
  TriggerClientEvent("notifyWarning:Client", source, message)
end)
