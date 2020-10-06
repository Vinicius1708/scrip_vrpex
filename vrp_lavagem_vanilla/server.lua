

-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
vRPclient = Tunnel.getInterface("vRP")
Tunnel.bindInterface("lavagem_vanilla",emP)
-- RESOURCE TUNNEL/PROXY
vRPlv = {}
Tunnel.bindInterface("lavagem_vanilla", vRPlv)
Proxy.addInterface("lavagem_vanilla", vRPlv)
LVclient = Tunnel.getInterface("lavagem_vanilla")

cfg = module("lavagem_vanilla", "cfg/config")

function vRPlv.lavarabrir()
    local source = source
    local user_id = vRP.getUserId(source)
    local amount = vRP.prompt(source, "Valor que você quer lavar:", "")
    local amount = parseInt(amount)
    if amount > 0 then
        if vRP.tryGetInventoryItem(user_id, "dinheirosujo", amount, true) then
			vRP.giveMoney(user_id, parseInt(amount * (cfg.lavagemporcento)))
            TriggerClientEvent("Notify", source, "sucesso", "Lavou <b>R$" .. vRP.format(amount) .. ",00 Sujo</b> e recebeu <b>R$" .. vRP.format(parseInt(amount * (cfg.lavagemporcento))) .. ",00</b> Limpo.")
			LVclient.jalimpououn(source)
		else
			TriggerClientEvent("Notify", source, "negado", "Valor insuficiente.")
			LVclient.jalimpououn(source)
        end
    end
end

function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"lavar.dinheiro")
end