local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_rastrear")

-- R A S T R E A R --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	local user_id = vRP.getUserId(s)
	local price = 5000
	if message == "/rastrear" then
		CancelEvent()
		--------------
		if vRP.tryGetInventoryItem(user_id,'rastreador',1) then 
			TriggerClientEvent('rastrear', s)
		else 
			vRPclient.notify(user_id, "Você não possui um rastreador")
		end
	end
end)