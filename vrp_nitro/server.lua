local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_nitro",func)  

function func.getNitro()
    local user_id = vRP.getUserId(source)
    if vRP.tryGetInventoryItem(user_id,"nitro",1) then
        return true
    else
        return false    
    end
end

function func.getNitroAmount()
    local user_id = vRP.getUserId(source)
    return {vRP.getInventoryItemAmount(user_id,"nitro")}
end    