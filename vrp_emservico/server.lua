local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","CVR_OnService")

ykP = {}
Tunnel.bindInterface("vrp_emservico",ykP)

local multa = 250

local webhookadmin = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


RegisterCommand('ptr', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade = vRP.getUsersByPermission("policia.permissao")

	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(35, 142, 219,0.9) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="http://officialyu.me/icones/police-hat.svg"> COPOM:<br>{0} </div>',
            args = { "Existem "..#quantidade.." PM's em Serviço no momento." }
        })
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('med', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("paramedico.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 12, 87,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="http://officialyu.me/icones/cardiogram.svg"> HOSPITAL:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." SAMU's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('taxista', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("taxista.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 162, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/2898/2898588.svg"> TAXISTAS:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." TAXISTA's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('mec', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("mecanico.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(125, 125, 125,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/1995/1995470.svg"> MECÂNICA:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." MECÂNICOS's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('conce', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("conce.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 50, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://image.flaticon.com/icons/svg/832/832815.svg"> CONCESSINÁRIA:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." VENDEDORES's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

function ykP.emServico()
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)

--------------------------
--	Concessionaria
--------------------------
	if vRP.hasGroup(user_id,"Concessionaria") then
		vRP.addUserGroup(user_id,"ConcessionariaPaycheck")
		return true
	 elseif vRP.hasGroup(user_id,"DONOConcessionaria") then
		vRP.addUserGroup(user_id,"DONOConcessionariaPaycheck")
		return true
---------POLICIAIS		
	elseif vRP.hasGroup(user_id,"COMANDANTE") then
		vRP.addUserGroup(user_id,"COMANDANTEPaycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Agente-PF") then
		vRP.addUserGroup(user_id,"PF1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Perito-PF") then
		vRP.addUserGroup(user_id,"PF2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Diretor-PF") then
		vRP.addUserGroup(user_id,"PF3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Recruta") then
		vRP.addUserGroup(user_id,"PMERJ1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Soldado") then
		vRP.addUserGroup(user_id,"PMERJ2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Cabo") then
		vRP.addUserGroup(user_id,"PMERJ3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Sargento") then
		vRP.addUserGroup(user_id,"PMERJ4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-SubTenente") then
		vRP.addUserGroup(user_id,"PMERJ5Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Tenente") then
		vRP.addUserGroup(user_id,"PMERJ6Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Capitao") then
		vRP.addUserGroup(user_id,"PMERJ7Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Major") then
		vRP.addUserGroup(user_id,"PMERJ8Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMERJ-Coronel") then
		vRP.addUserGroup(user_id,"PMERJ9Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
			["WEAPON_PISTOL_MK2"] = {ammo=90},
			["WEAPON_SMG"] = {ammo=250},
			["WEAPON_NIGHTSTICK"] = {ammo=1},
			["WEAPON_STUNGUN"] = {ammo=1},
			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Investigador-PC") then
		vRP.addUserGroup(user_id,"PC1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Perito-PC") then
		vRP.addUserGroup(user_id,"PC2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Delegado-PC") then
		vRP.addUserGroup(user_id,"PC3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF1") then
		vRP.addUserGroup(user_id,"PRF1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF2") then
		vRP.addUserGroup(user_id,"PRF2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF3") then
		vRP.addUserGroup(user_id,"PRF3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF4") then
		vRP.addUserGroup(user_id,"PRF4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM1") then
		vRP.addUserGroup(user_id,"RECOM1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM2") then
		vRP.addUserGroup(user_id,"RECOM2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM3") then
		vRP.addUserGroup(user_id,"RECOM3Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM4") then
		vRP.addUserGroup(user_id,"RECOM4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM5") then
		vRP.addUserGroup(user_id,"RECOM5Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM6") then
		vRP.addUserGroup(user_id,"RECOM6Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"RECOM7") then
		vRP.addUserGroup(user_id,"RECOM7Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE1") then
		vRP.addUserGroup(user_id,"BOPE1Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE2") then
		vRP.addUserGroup(user_id,"BOPE2Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE3") then
		vRP.addUserGroup(user_id,"BOPE4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE4") then
		vRP.addUserGroup(user_id,"BOPE4Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE5") then
		vRP.addUserGroup(user_id,"BOPE5Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE6") then
		vRP.addUserGroup(user_id,"BOPE6Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BOPE7") then
		vRP.addUserGroup(user_id,"BOPE7Paycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BPCHQ") then
		vRP.addUserGroup(user_id,"BPCHQPaycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"GAM") then
		vRP.addUserGroup(user_id,"GAMPaycheck")
		TriggerEvent('eblips:add',{ name = "Policial", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
---------HOSPITAL	
	elseif vRP.hasGroup(user_id,"Enfermeiro") then
		vRP.addUserGroup(user_id,"EnfermeiroPaycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Paramedico") then
		vRP.addUserGroup(user_id,"ParamedicoPaycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Diretor") then
		vRP.addUserGroup(user_id,"DiretorPaycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
---------Mecanico	
elseif vRP.hasGroup(user_id,"Mecanico") then
	vRP.addUserGroup(user_id,"MecanicoPaycheck")
	return true
elseif vRP.hasGroup(user_id,"LiderMecanico") then
	vRP.addUserGroup(user_id,"LiderMecanicoPaycheck")
--------Taxi
elseif vRP.hasGroup(user_id,"Taxista") then
	vRP.addUserGroup(user_id,"TaxistaPaycheck")
	return true
	
	end
end

function ykP.offService()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerEvent('eblips:remove',source)

	--Concessionaria
	vRP.removeUserGroup(user_id,"ConcessionariaPaycheck")
	vRP.removeUserGroup(user_id,"DONOConcessionariaPaycheck")
	--Policia
	vRP.removeUserGroup(user_id,"COMANDANTEPaycheck")
	vRP.removeUserGroup(user_id,"PF1Paycheck")
	vRP.removeUserGroup(user_id,"PF2Paycheck")
	vRP.removeUserGroup(user_id,"PF3Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ1Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ2Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ3Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ4Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ5Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ6Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ7Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ8Paycheck")
	vRP.removeUserGroup(user_id,"PMERJ9Paycheck")
	vRP.removeUserGroup(user_id,"PC1Paycheck")
	vRP.removeUserGroup(user_id,"PC2Paycheck")
	vRP.removeUserGroup(user_id,"PC3Paycheck")
	vRP.removeUserGroup(user_id,"PRF1Paycheck")
	vRP.removeUserGroup(user_id,"PRF2Paycheck")
	vRP.removeUserGroup(user_id,"PRF3Paycheck")
	vRP.removeUserGroup(user_id,"PRF4Paycheck")
	vRP.removeUserGroup(user_id,"RECOM1Paycheck")
	vRP.removeUserGroup(user_id,"RECOM2Paycheck")
	vRP.removeUserGroup(user_id,"RECOM3Paycheck")
	vRP.removeUserGroup(user_id,"RECOM4Paycheck")
	vRP.removeUserGroup(user_id,"RECOM5Paycheck")
	vRP.removeUserGroup(user_id,"RECOM6Paycheck")
	vRP.removeUserGroup(user_id,"RECOM7Paycheck")
	vRP.removeUserGroup(user_id,"BOPE1Paycheck")
	vRP.removeUserGroup(user_id,"BOPE2Paycheck")
	vRP.removeUserGroup(user_id,"BOPE3Paycheck")
	vRP.removeUserGroup(user_id,"BOPE4Paycheck")
	vRP.removeUserGroup(user_id,"BOPE5Paycheck")
	vRP.removeUserGroup(user_id,"BOPE6Paycheck")
	vRP.removeUserGroup(user_id,"BOPE7Paycheck")
	vRP.removeUserGroup(user_id,"BPCHQPaycheck")
	vRP.removeUserGroup(user_id,"GAMPaycheck")
	--Hospital
	vRP.removeUserGroup(user_id,"EnfermeiroPaycheck")
	vRP.removeUserGroup(user_id,"ParamedicoPaycheck")
	vRP.removeUserGroup(user_id,"DiretorPaycheck")
	--Mecanica
	vRP.removeUserGroup(user_id,"LIDERMecanicoPaycheck")
	vRP.removeUserGroup(user_id,"MecanicoPaycheck")
	--Taxista
	vRP.removeUserGroup(user_id,"TaxistaPaycheck")

end