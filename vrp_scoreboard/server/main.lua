-- DEFAULT --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

local connectedPlayers = {}

RegisterServerEvent("vrp_scoreboard:requestOpenScoreboard")
AddEventHandler("vrp_scoreboard:requestOpenScoreboard", function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        TriggerClientEvent("vrp_scoreboard:doRequestScoreboard", source, true)
    end
end)

RegisterServerEvent("vrp_scoreboard:getConnectedPlayers")
AddEventHandler("vrp_scoreboard:getConnectedPlayers", function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
	local player = vRP.getUserSource(user_id)
	if gtype == "job" then 
		connectedPlayers[user_id].job = group
		TriggerClientEvent('vrp_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
	end
end)

AddEventHandler('vrp:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name

	TriggerClientEvent('vrp_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
	AddPlayerToScoreboard(source, true)
end)

AddEventHandler("vRP:playerLeave",function(user_id, player) 
	connectedPlayers[user_id] = nil

	TriggerClientEvent('vrp_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		UpdatePing()
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

function AddPlayerToScoreboard(source, update)
	local playerId = vRP.getUserId(source)
	if playerId then
		connectedPlayers[playerId] = {}
		connectedPlayers[playerId].ping = GetPlayerPing(source)
		connectedPlayers[playerId].id = playerId
		connectedPlayers[playerId].name = GetPlayerName(source)
		connectedPlayers[playerId].job = vRP.getUserGroupByType(playerId,"job") or "Civil"

		if update then
			TriggerClientEvent('vrp_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
		end
	end
	--[[if xPlayer.player.getGroup() == 'user' then
		Citizen.CreateThread(function()
			Citizen.Wait(3000)
			TriggerClientEvent('vrp_scoreboard:toggleID', playerId, false)
		end)
	end]]
end

function AddPlayersToScoreboard()
	local users = vRP.getUsers()
	for k,v in pairs(users) do
		AddPlayerToScoreboard(v, false)
	end

	TriggerClientEvent('vrp_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end

function UpdatePing()
	for k,v in pairs(connectedPlayers) do
		v.ping = GetPlayerPing(k)
	end

	TriggerClientEvent('vrp_scoreboard:updatePing', -1, connectedPlayers)
end

Citizen.CreateThread(function()
	local uptimeMinute, uptimeHour, uptime = 0, 0, ''

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		uptimeMinute = uptimeMinute + 1

		if uptimeMinute == 60 then
			uptimeMinute = 0
			uptimeHour = uptimeHour + 1
		end

		uptime = string.format("%02dh %02dm", uptimeHour, uptimeMinute)
		SetConvarServerInfo('Uptime', uptime)


		TriggerClientEvent('uptime:tick', -1, uptime)
		TriggerEvent('uptime:tick', uptime)
	end
end)