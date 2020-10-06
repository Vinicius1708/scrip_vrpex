local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_helpdesk")


-- Server events
RegisterServerEvent("vrp_helpdesk:getCases")
AddEventHandler("vrp_helpdesk:getCases",function()
    local user_id = vRP.getUserId(source)
    local _source = source
    showMyCases(user_id, _source)
end)

RegisterServerEvent("vrp_helpdesk:getCase")
AddEventHandler("vrp_helpdesk:getCase",function(id)
    local user_id = vRP.getUserId(source)
    local _source = source
    openCase(id, _source, user_id)
end)

RegisterServerEvent("vrp_helpdesk:applyReply")
AddEventHandler("vrp_helpdesk:applyReply",function(message, id, replyid)
    local user_id = vRP.getUserId(source)
    local _source = source
    local nplayer = vRP.getUserSource(tonumber(replyid))
    addReply(user_id, message, id)
    openCase(id, _source, user_id)
    vRPclient.playSound(nplayer,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
    TriggerClientEvent("Notify",nplayer,"importante","Atualização do ticket <b>#"..id.."</b>.")
    admins =  vRP.getUsersByPermission("admin.permissao")
    for l,w in pairs(admins) do
    local player = vRP.getUserSource(parseInt(w))
        if player then
            vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
            TriggerClientEvent("Notify",player,"importante","<b>Atualização no Ticket #"..id.."</b>.")
        end
    end
end)

RegisterServerEvent("vrp_helpdesk:closeCase")
AddEventHandler("vrp_helpdesk:closeCase",function(id)
    local user_id = vRP.getUserId(source)
    local _source = source
    closeCase(id)
    openCase(id, _source, user_id)
end)

RegisterServerEvent("vrp_helpdesk:deleteCase")
AddEventHandler("vrp_helpdesk:deleteCase",function(id)
    local user_id = vRP.getUserId(source)
    local _source = source
    deleteCase(id)
    showMyCases(user_id, _source)
end)

RegisterServerEvent("vrp_helpdesk:newCase")
AddEventHandler("vrp_helpdesk:newCase",function(title, message)
    local user_id = vRP.getUserId(source)
    local _source = source
    local identity = vRP.getUserIdentity(user_id)
    newCase(user_id, title, message)
    showMyCases(user_id, _source)
    admins =  vRP.getUsersByPermission("admin.permissao")
    for l,w in pairs(admins) do
        local player = vRP.getUserSource(parseInt(w))
        local nuser_id = vRP.getUserId(player)
        if player then
            vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
            TriggerClientEvent("Notify",player,"importante","<b>Ticket recebido</b>.")
        end
    end
end)

RegisterServerEvent("vrp_helpdesk:getSupportCases")
AddEventHandler("vrp_helpdesk:getSupportCases",function()
    local user_id = vRP.getUserId(source)
    local _source = source
    showSupportCases(_source, user_id)
end)

RegisterServerEvent("vrp_helpdesk:gotoPlayer")
AddEventHandler("vrp_helpdesk:gotoPlayer",function(targetID)
    local user_id = vRP.getUserId(source)
    local _source = source
    local tplayer = vRP.getUserSource(tonumber(targetID))
    if tplayer ~= nil then 
        --vRPclient.toggleNoclip(source)
        vRPclient.teleport(source,vRPclient.getPosition(tplayer))
        return true
    else
        TriggerClientEvent("Notify",_source,"negado","Jogador não esta mais na cidade.")
        return false
    end
end)

function showMyCases(user_id, _source)
    MySQL.Async.fetchAll('SELECT * FROM vrp_helpdesk_ticket WHERE user_id = @user_id', {
        ["@user_id"] = user_id
    }, function(data)
        local supportPermissions = false
        if vRP.hasPermission(user_id, Config.RequiredSupportPermission) then
            supportPermissions = true
        end
        TriggerClientEvent("vrp_helpdesk:showMyCases", _source, data, {
            supportPermissions = supportPermissions
        })
    end)
end

function showSupportCases(_source, user_id)
    MySQL.Async.fetchAll('SELECT * FROM vrp_helpdesk_ticket WHERE status = 1', {},function(data)
        local supportPermissions = false
        if vRP.hasPermission(user_id, Config.RequiredSupportPermission) then
            supportPermissions = true
        end
        TriggerClientEvent("vrp_helpdesk:showSupportCases", _source, data, {
            supportPermissions = supportPermissions
        })
    end)
end

function openCase(id, _source, user_id)
    getCase(id, function(case)
        if #case > 0 then
            getCaseReplies(id, function(replies)
                local supportPermissions = false
                if vRP.hasPermission(user_id, Config.RequiredSupportPermission) then
                    supportPermissions = true
                end
                TriggerClientEvent("vrp_helpdesk:openCase", _source, case[1], replies, {supportPermissions = supportPermissions})
            end)
        else
            print("træls")
        end
    end)
end

-- SQL functions
function getCase(id, cb)
    MySQL.Async.fetchAll('SELECT * FROM vrp_helpdesk_ticket WHERE id = @id', {
        ["@id"] = id
    }, function(data)
        cb(data)
    end)
end

function getCaseReplies(id, cb)
    MySQL.Async.fetchAll('SELECT * FROM vrp_helpdesk_respostas WHERE case_id = @id', {
        ["@id"] = id
    }, function(data)
        cb(data)
    end)
end

function addReply(user_id, message, id)
    MySQL.Sync.execute("INSERT INTO vrp_helpdesk_respostas SET user_id = @user_id, message = @message, case_id = @case_id, createdAt = @createdAt", {
        ['@user_id'] = user_id, 
        ['@message'] = message,
        ['@case_id'] = id,
        ['@createdAt'] = os.time()
    })
end

function closeCase(id)
    MySQL.Sync.execute("UPDATE vrp_helpdesk_ticket SET status = 0 WHERE id = @case_id", {
        ['@case_id'] = id
    })
end

function deleteCase(id)
    MySQL.Sync.execute("DELETE FROM vrp_helpdesk_ticket WHERE id = @case_id", {
        ['@case_id'] = id
    })
end

function newCase(user_id, title, message)
    MySQL.Sync.execute("INSERT INTO vrp_helpdesk_ticket SET user_id = @user_id, title = @title, message = @message, createdAt = @createdAt", {
        ['@user_id'] = user_id, 
        ['@title'] = title,
        ['@message'] = message,
        ['@createdAt'] = os.time()
    })
end

-- Register menu builder
local open_menu = {function(player,choice)
    TriggerClientEvent("vrp_helpdesk:openGui", player)
end}

vRP.registerMenuBuilder("admin", function(add, data)
    local user_id = vRP.getUserId(data.player)
    if user_id ~= nil then
      local choices = {}
      choices["Åben hjælpcenter"] = open_menu
      add(choices)
    end
end)