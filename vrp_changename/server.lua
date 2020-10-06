local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPN = {}
Tunnel.bindInterface("vrp_changename",vRPN)
Proxy.addInterface("vrp_changename",vRPN)

vRP.prepare("vRP/update_user_first_spawn","UPDATE vrp_user_identities SET firstname = @firstname, name = @name, age = @age WHERE user_id = @user_id")



RegisterServerEvent("hoppe:changename")
AddEventHandler("hoppe:changename",function(characterNome,characterSobrenome,characterAge)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if checkregister() then
			vRP.execute("vRP/update_user_first_spawn",{ user_id = user_id, firstname = characterSobrenome, name = characterNome, age = characterAge })
			TriggerClientEvent("Notify",source, "sucesso", "Nome alterado para "..characterNome.." "..characterSobrenome)
			TriggerClientEvent("Notify",source, "importante", "Você não pagou pois é a primeira vez!")
		elseif vRP.tryFullPayment(user_id,250000) then
			vRP.execute("vRP/update_user_first_spawn",{ user_id = user_id, firstname = characterSobrenome, name = characterNome, age = characterAge })
			TriggerClientEvent("Notify",source, "sucesso", "Nome alterado para "..characterNome.." "..characterSobrenome)
		else
			TriggerClientEvent("Notify",source, "negado", "Você não possui dinheiro.")
		end	
	end
end)

function checkregister()
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if identity.name == "" and identity.firstname == "" then
		return true
	elseif identity.name == "Individuo" and identity.firstname == "Indigente" then
		return true
	else
		return false
	end		
end	