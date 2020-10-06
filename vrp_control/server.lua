local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")

vRPclient = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")

local cfg = module("vrp", "cfg/groups")
local groups = cfg.groups

func = {}
Tunnel.bindInterface("vrp_control_people", func)

funcCliente = Tunnel.getInterface("vrp_control_people")

vRP._prepare("vRP/update_foto",
             "UPDATE vrp_user_identities SET foto = @foto WHERE user_id = @user_id")
vRP._prepare("vRP/insert_policia",
             "INSERT IGNORE INTO policia (police_id,user_id,dkey,dvalue,img,valor,datahora,id_pai) VALUES (@police_id, @user_id, @dkey, @dvalue, @img, @valor, NOW(),@id_pai)")
vRP._prepare("vRP/select",
             "SELECT p.id, p.dvalue, p.img, p.valor, DATE_FORMAT(p.datahora, '%d/%m/%Y %H:%i') datahora, u.name, u.firstname FROM policia p INNER JOIN vrp_user_identities u ON u.user_id=p.police_id WHERE p.user_id = @user_id AND p.dkey=@dkey ORDER BY 1 DESC LIMIT 0,20")
vRP._prepare("vRP/select_all",
             "SELECT p.id, p.dvalue, u2.foto, p.valor, DATE_FORMAT(p.datahora, '%d/%m/%Y %H:%i') datahora, u.name as nomePolicia,    u.firstname as sobrenomePolicia,    u2.name as nomeForagido,    u2.firstname as sobrenomeForagido FROM policia p INNER JOIN    vrp_user_identities u ON u.user_id = p.police_id        INNER JOIN    vrp_user_identities u2 ON u2.user_id = p.user_id WHERE p.dkey=@dkey ORDER BY 1 DESC LIMIT 0,20")

vRP._prepare("vRP/select_foragidos",
             "SELECT p.id, p.user_id, p.dvalue, u2.foto, p.valor, DATE_FORMAT(p.datahora, '%d/%m/%Y %H:%i') datahora, u.name as nomePolicia,    u.firstname as sobrenomePolicia,    u2.name as nomeForagido,    u2.firstname as sobrenomeForagido FROM    policia p        INNER JOIN    vrp_user_identities u ON u.user_id = p.police_id        INNER JOIN    vrp_user_identities u2 ON u2.user_id = p.user_id WHERE    p.dkey = 'foragido' AND u2.foragido = 1 ORDER BY 1 DESC")

vRP._prepare("vRP/update_foragido",
             "UPDATE vrp_user_identities SET foragido = @foragido WHERE user_id = @user_id")
vRP._prepare("vRP/delete_foragido",
             "DELETE FROM policia WHERE dkey = 'foragido' AND user_id = @user_id")
-- vRP._prepare("vRP/count_vehicle",
--              "SELECT COUNT(*) as qtd FROM vrp_user_vehicles WHERE vehicle = @vehicle")
-- vRP._prepare("vRP/get_maxcars",
--              "SELECT COUNT(vehicle) as quantidade FROM vrp_user_vehicles WHERE user_id = @user_id")
-- vRP._prepare("vRP/get_total_carros_tipo",
--              "SELECT vehicle, count(1) total FROM vrp.vrp_user_vehicles GROUP BY vehicle")

function func.setRegistro(passaporte, dkey, dvalue, img, valor, id_pai)
    local source = source
    local police_id = vRP.getUserId(source)

    local isForagido = false

    if dkey == "foragido" and valor == 1 then
        local foragidos = vRP.query("vRP/select_foragidos")
        for a, b in pairs(foragidos) do
            if b.user_id == passaporte then
                isForagido = true
                return
            end
        end
    end

    if (dkey == "foragido" and not isForagido and valor == 1) or dkey ~=
        "foragido" then

        vRP.execute("vRP/insert_policia", {
            police_id = police_id,
            user_id = passaporte,
            dkey = dkey,
            dvalue = dvalue,
            img = img,
            valor = valor or 0,
            id_pai = id_pai or 0
        })
    elseif dkey == "foragido" and valor == 0 then
        vRP.execute("vRP/delete_foragido", {user_id = passaporte})
    end
    if dkey == "multa" then func.setMulta(passaporte, valor) end
    if dkey == "prisao" then func.setPrisao(passaporte, valor) end
    if dkey == "foragido" then
        vRP.execute("vRP/update_foragido",
                    {foragido = valor, user_id = passaporte})
    end

    return true
end

local inPrisao = {}

function func.setPrisao(id, tempo)
    if tempo > 0 then
        local player = vRP.getUserSource(parseInt(id))
        if player then
            if not vRPclient.isHandcuffed(player) then
                vRPclient.toggleHandcuff(player)
            end
            inPrisao[id] = tempo
            funcCliente.carroPrisao(player, id, tempo)
        else
            func.setPrisao2(id, tempo)
        end
    end
end

function func.setPrisao2(id, tempo)
    if tempo > 0 then
        local source = source

        local player = vRP.getUserSource(parseInt(id))
        vRP.setUData(parseInt(id), "vRP:prisao", json.encode(parseInt(tempo)))
        if player then
            vRPclient.setHandcuffed(player, false)
            TriggerClientEvent('prisioneiro', player, true)
            vRPclient.teleport(player, 1680.1, 2513.0, 45.5)
        end
        TriggerEvent("prison_lock", parseInt(id))
        vRPclient.playSound(source, "Hack_Success",
                            "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
        inPrisao[id] = 0
    end
end

function func.setFuga(id)
    local source = source
    local nuser_id = vRP.getUserId(source)
    inPrisao[nuser_id] = 0
end

AddEventHandler("playerDropped",function(reason)
	local source = source
    local nuser_id = vRP.getUserId(source)
    
    if inPrisao[nuser_id] and inPrisao[nuser_id] > 0 then
        func.setPrisao2(nuser_id, inPrisao[nuser_id])
    end
end)

function func.setMulta(id, valor)
    local source = source
    if valor > 0 then

        local value = vRP.getUData(parseInt(id), "vRP:multas")
        local multas = json.decode(value) or 0
        vRP.setUData(parseInt(id), "vRP:multas",
                     json.encode(parseInt(multas) + parseInt(valor)))

        local player = vRP.getUserSource(parseInt(id))
        if player then
            TriggerClientEvent("Notify", player, "importante",
                               "Você foi multado no valor de $" ..
                                   vRP.format(parseInt(valor)))
        end
        vRPclient.playSound(source, "Hack_Success",
                            "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
    end
end

function func.getDatasUser(id, dkey)
    if id <= 0 then
        return vRP.query("vRP/select_all", {dkey = dkey})
    else
        return vRP.query("vRP/select", {user_id = id, dkey = dkey})
    end
end

function func.getForagidos(dkey) return vRP.query("vRP/select_foragidos") end

function func.updateFoto(foto, user_id)
    vRP.execute("vRP/update_foto", {foto = foto, user_id = user_id})
end

function func.Identidade(user_id)
    local nplayer = vRP.getUserSource(parseInt(user_id))
    local nuser_id = vRP.getUserId(nplayer)

    if user_id then

        local identity = vRP.getUserIdentity(user_id)
        local multas = vRP.getUData(user_id, "vRP:multas")
        local mymultas = json.decode(multas) or 0

        local groupv = func.getUserGroupByType(nuser_id, "job")
        local cargo = func.getUserGroupByType(nuser_id, "cargo")
        if cargo ~= "" then groupv = cargo end

        if groupv == "Mafia" or groupv == "Motoclub" or groupv == "Ballas" or
            groupv == "Vagos" or groupv == "Groove" or groupv == "Desmanche" then groupv = "" end

        if identity then
            return identity, vRP.format(parseInt(mymultas)), groupv
        end
    end
end

function func.getUserGroupByType(user_id, gtype)
    local user_groups = vRP.getUserGroups(user_id)
    for k, v in pairs(user_groups) do
        local kgroup = groups[k]
        if kgroup then
            if kgroup._config and kgroup._config.gtype and kgroup._config.gtype ==
                gtype then return kgroup._config.title end
        end
    end
    return ""
end

function func.isPolice()
    local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id, "policia.permissao")
end
