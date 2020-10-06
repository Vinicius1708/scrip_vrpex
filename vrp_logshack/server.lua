local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_logshack",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookhack = "https://discordapp.com/api/webhooks/751268018226462760/JpjRGEs3pYVQroOBgAgF4bdP1ESAn6Uf02hQ9w_9ZDZ828Z1x05E-auBTN9kksykv99d"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

--------------------------------------
-- WEB

function func.buttonInsert()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [INSERT].```")
	end
end

function func.buttonNumOito()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [NUMPAD 8].```")
	end
end

function func.buttonNumSeis()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [NUMPAD 6].```")
	end
end

function func.buttonSetaCima()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [SETA PRA CIMA].```")
	end
end

function func.buttonSetaBaixo()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [SETA PRA BAIXO].```")
	end
end

function func.buttonfUm()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [F1].```")
	end
end

function func.buttonfOnze()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		SendWebhookMessage(webhookhack, "``` O ID: " ..user_id.. " PRESSIONOU [F11].```")
	end
end
