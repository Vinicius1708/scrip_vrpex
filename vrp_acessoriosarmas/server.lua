local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local requerItem = true

vRP = Proxy.getInterface("vRP")

--[[AddEventHandler('chatMessage', function(source, n, message)
    command = stringsplit(message, " ")
    local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)
	
	if requerItem then
		if command[1] == "/silenciador" then
			if vRP.getInventoryItemAmount(user_id, "silenciador") >= 1 then
				TriggerClientEvent('eden_accesories:silenciador', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem um <b>Silenciador</b>.")	
			end
		elseif command[1] == "/lanterna" then
			if vRP.getInventoryItemAmount(user_id, "lant") >= 1 then
				TriggerClientEvent('eden_accesories:lanterna', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem uma <b>Lanterna</b>.")	
			end
		elseif command[1] == "/grip" then
			if vRP.getInventoryItemAmount(user_id, "grip") >= 1 then
				TriggerClientEvent('eden_accesories:grip', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem um <b>Grip</b>.")				
			end
		elseif command[1] == "/skin" then
			if vRP.getInventoryItemAmount(user_id, "skin") >= 1 then
				TriggerClientEvent('eden_accesories:skin', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem uma <b>Skin</b>.")	
			end
		end
	else
		if command[1] == "/silenciador" then
			TriggerClientEvent('eden_accesories:silenciador', source)
		elseif command[1] == "/lanterna" then
			TriggerClientEvent('eden_accesories:lanterna', source)
		elseif command[1] == "/grip" then
			TriggerClientEvent('eden_accesories:grip', source)
		elseif command[1] == "/skin" then
			TriggerClientEvent('eden_accesories:skin', source)
		end	
	end
end)]]


AddEventHandler('chatMessage', function(source, n, message)
    command = stringsplit(message, " ")
    local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)
	
	if requerItem then
		if command[1] == "/silenciador" then
			if vRP.hasGroup(user_id,"VipArmas") then
				TriggerClientEvent('eden_accesories:silenciador', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem um plano <b>VIP</b>.")	
			end
		elseif command[1] == "/lanterna" then
			if vRP.hasGroup(user_id,"VipArmas") then
				TriggerClientEvent('eden_accesories:lanterna', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem um plano <b>VIP</b>.")	
			end
		elseif command[1] == "/grip" then
			if vRP.hasGroup(user_id,"VipArmas") then
				TriggerClientEvent('eden_accesories:grip', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem um plano <b>VIP</b>.")				
			end
		elseif command[1] == "/skin" then
			if vRP.hasGroup(user_id,"Platina") or vRP.hasGroup(user_id,"VipArmas") then
				TriggerClientEvent('eden_accesories:skin', source)
			else
				TriggerClientEvent("Notify",source,"negado","Você não tem um plano <b>VIP</b>.")	
			end
		end
	else
		if command[1] == "/silenciador" then
			TriggerClientEvent('eden_accesories:silenciador', source)
		elseif command[1] == "/lanterna" then
			TriggerClientEvent('eden_accesories:lanterna', source)
		elseif command[1] == "/grip" then
			TriggerClientEvent('eden_accesories:grip', source)
		elseif command[1] == "/skin" then
			TriggerClientEvent('eden_accesories:skin', source)
		end	
	end
end)


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end