local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_trucker")
RegisterServerEvent('sawu_hookers:pay')
AddEventHandler('sawu_hookers:pay', function(boolean)
	local user_id = vRP.getUserId(source)
    if (boolean == true) then       
        if(vRP.tryFullPayment(user_id, Config.BlowjobPrice))then
            TriggerClientEvent("Notify",source,"importante","Boquete iniciado.")
            TriggerClientEvent("Notify",source,"sucesso","Pagou 10.000.")
            TriggerClientEvent('sawu_hookers:startBlowjob', source)            
        else
            TriggerClientEvent("Notify",source,"negado","Não possui dinheiro suficiente.")            
            TriggerClientEvent('sawu_hookers:noMoney', source)
        end  
    else
        if(vRP.tryFullPayment(user_id, Config.SexPrice))then
            TriggerClientEvent('sawu_hookers:startSex', source)
            TriggerClientEvent("Notify",source,"importante","Sexo iniciado.")
            TriggerClientEvent("Notify",source,"sucesso","Pagou 15.000.")
        else
            TriggerClientEvent("Notify",source,"negado","Não possui dinheiro suficiente.")
            TriggerClientEvent('sawu_hookers:noMoney', source)
        end 
    end
end)




