-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local cfg = module("vrp","cfg/groups")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
vRPN = {}
Tunnel.bindInterface("vrp_identidade",vRPN)
Proxy.addInterface("vrp_identidade",vRPN)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local groups = cfg.groups
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.Identidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local cash = vRP.getMoney(user_id)
		local banco = vRP.getBankMoney(user_id)
		local coins = vRP.getCoins(user_id)
		local identity = vRP.getUserIdentity(user_id)
		local multas = vRP.getUData(user_id,"vRP:multas")
		local mymultas = json.decode(multas) or 0
		local paypal = vRP.getUData(user_id,"vRP:paypal")
		local mypaypal = json.decode(paypal) or 0
		local bills = vRP.getBills(user_id)
		local job = vRPN.getUserGroupByType(user_id,"job")
		local cargo = vRPN.getUserGroupByType(user_id,"cargo")
		local vip = vRPN.getUserGroupByType(user_id,"vip")
		if identity then
			return vRP.format(parseInt(cash)),vRP.format(parseInt(banco)),vRP.format(parseInt(mypaypal)),identity.name,identity.firstname,identity.age,identity.user_id,identity.registration,identity.phone,job,cargo,vip,vRP.format(parseInt(mymultas)),vRP.format(parseInt(mybills)),identity.phone
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPN.getUserGroupByType(user_id,gtype)
	local user_groups = vRP.getUserGroups(user_id)
	for k,v in pairs(user_groups) do
		local kgroup = groups[k]
		if kgroup then
			if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == gtype then
				return kgroup._config.title
			end
		end
	end
	return ""
end