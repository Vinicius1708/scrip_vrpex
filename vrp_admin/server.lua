local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO MYSQL
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("vRP/rem_allcars","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP.prepare("vRP/rem_allhouses","DELETE FROM vrp_homes_permissions WHERE user_id = @user_id")
vRP.prepare("vRP/get_allvehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookgroup = "https://discordapp.com/api/webhooks/731605465406111885/Vcut3elU-e7ukBD-StsdEnL9ipEVlcX-VGRNw8qVn4_8SWncXAwdivIHvIV6o4H1g0dF"
local webhookaddrem = "https://discordapp.com/api/webhooks/731605473572159499/sca2LQCxRL9UNxr0S4NsiojyeOsj7KaZMxatttiQRjvwIsg_KfDZiTb7HDFvrJUKw8fu"
local webhookfac = "https://discordapp.com/api/webhooks/731605420162023444/5fRJGyjIyiGRfscrincnfr2ptqZTR3pd1bwWNDck9xyqXE0wnMJ_1Qs9kADENTdjAG_k"
local webhookcar = "https://discordapp.com/api/webhooks/731605306378813502/AsANrxchDxQ-a2YA6maF2-jSnjLEQjiDzG3s1AwzI7WjOFVmjOwfGYdLqq6-imdwFNBv"
local webhooknctp = "https://discordapp.com/api/webhooks/731605214712299570/mtU-ul5m18OHVQKCfbSwdujZq_qxHAQb2wuoRz8wLi04V2d4Vm5lYvTwQU4kOgtAHj1A"
local webhookmoney = "https://discordapp.com/api/webhooks/731605094042304644/F8hxrnknhEZw-7Lh0KJiIzM2dheb8IB9Fevn1MFII17HhRU1rrVaf93EONyy0Ye6uq1p"
local webhookban = "https://discordapp.com/api/webhooks/731604956485910529/EzPGcdlUTNEtPzSpMt8hVFJIXshEpWoxhKw__xgmIdWgzo07K7nAZ_3U7lODulDHNyrl"
local webhookwl = "https://discordapp.com/api/webhooks/731604726927589401/U7Zl79LmquU4dE5nrjFwNB2DHNvd51kd2Z-3FrDXHKiJfTbuFSiFJW5t9H5Mg3B_bSNM"
local webhookgod = "https://discordapp.com/api/webhooks/731604582882344980/St6QD3nk55eZdEbb2UTf87QRGme0VmBe0MHjzOG1ESCwPDMbOHXOGvdliYjF4SSdR7wg"
local webhookcds = ""
local webhookblacklist = ""
local webhookkick = "https://discordapp.com/api/webhooks/731604416670466118/TiRdpNIr0X0IGLaNgyZswQU34Md9DGTU3SGDWwfs2pEINYQ-3rUhHokuNjUDBBlYt4bv"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent("adminLogs:Armamentos")
AddEventHandler("adminLogs:Armamentos",function(weapon)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
    	SendWebhookMessage(webhookblacklist,"```prolog\n[BLACKLIST ARMAS]: "..user_id.." " .. "\n[ARMA]: " .. weapon ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&641048265856647169>")  
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESET PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('resetplayer',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if user_id then
            if args[1] then
                local identity = vRP.getUserIdentity(parseInt(args[1]))
                if vRP.request(source,"Deseja resetar o Passaporte: <b>"..args[1].." "..identity.name.." "..identity.firstname.."</b> ?",30) then
                    local id = vRP.getUserSource(parseInt(args[1]))
                    if id then  
                        vRP.kick(id,"Você foi expulso da cidade.")
                    end
                    local myHomes = vRP.query("homes/get_homeuserid",{ user_id = parseInt(args[1]) })
                    if parseInt(#myHomes) >= 1 then
                        for k,v in pairs(myHomes) do
                            local ownerHomes = vRP.query("homes/get_homeuserowner",{ user_id = parseInt(args[1]), home = tostring(v.home) })
                            if ownerHomes[1] then
                                for k,i in pairs(ownerHomes) do
                                    vRP.execute("creative/rem_srv_data",{ dkey = "chest:"..tostring(i.home) })
                                    vRP.execute("creative/rem_srv_data",{ dkey = "outfit:"..tostring(i.home) })
                                    vRP.execute("homes/rem_allpermissions",{ home = tostring(i.home) })
                                end
                                vRP.execute("homes/rem_permissions",{ home = tostring(v.home), user_id = parseInt(args[1]) })
                                vRP.execute("vRP/rem_allhouses",{ user_id = parseInt(args[1]) })
                            end
                        end
                    end
                    local myCars = vRP.query("vRP/get_allvehicles",{ user_id = parseInt(args[1]) })
                    if parseInt(#myCars) >= 1 then
                        for k,v in pairs(myCars) do
                            vRP.execute("creative/rem_srv_data",{ dkey = "chest:u"..parseInt(args[1]).."veh_"..tostring(v.vehicle) })
                            vRP.execute("creative/rem_srv_data",{ dkey = "custom:u"..parseInt(args[1]).."veh_"..tostring(v.vehicle) })
                            vRP.execute("vRP/rem_allcars",{ user_id = parseInt(args[1]) })
                        end
                    end
                    vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(vRP.getUserDataTable(parseInt(args[1]))))
                    vRP.setUData(parseInt(args[1]),"vRP:multas",parseInt(0))
                    vRP.setUData(parseInt(args[1]),"vRP:paypal",parseInt(0))
                    vRP.setUData(parseInt(args[1]),"vRP:prisao",parseInt(-1))
                    vRP.setUData(parseInt(args[1]),"vRP:spawnController",parseInt(0))
                    vRP.setUData(parseInt(args[1]),"vRP:tattoos",json.encode(vRP.getUserDataTable(parseInt(args[1]))))
                    vRP.execute("vRP/set_money",{ user_id = parseInt(args[1]), wallet = 1000, bank = 2000 })
                    TriggerClientEvent("Notify",source,"sucesso","Você resetou o Passaporte: <b>"..parseInt(args[1]).." "..identity.name.." "..identity.firstname.."</b>.")
                end          
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ RENAME ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rename',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id, "mindmaster.permissao") then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local nome = vRP.prompt(source, "Novo nome", "")
		local firstname = vRP.prompt(source, "Novo sobrenome", "")
		local idade = vRP.prompt(source, "Nova idade", "")
		local NumberPhone = vRP.prompt(source, "Novo Telefone")
        local identity = vRP.getUserIdentity(parseInt(user_id))
        vRP.execute("vRP/update_user_identity",{
            user_id = idjogador,
            firstname = firstname,
            name = nome,
            age = idade,
            registration = identity.registration,
            phone = identity.phone
        })
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR cor
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('carcolor',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local vehicle = vRPclient.getNearestVehicle(source,7)
        if vehicle then
            local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
            rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
            local r,g,b = table.unpack(splitString(rgb," "))
            TriggerClientEvent('vcolorv',source,vehicle,tonumber(r),tonumber(g),tonumber(b))
            
            TriggerClientEvent('Notify',source,"sucesso","Cor alterada")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>" 
            end

            player_customs[source] = true
            vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 250px; margin-top: 200px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Blips
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        blips[source] = { source }
       TriggerClientEvent("blips:updateBlips",-1,blips)
        if vRP.hasPermission(user_id,"blips.permissao") then
            TriggerClientEvent("blips:adminStart",source)
        end
     end
 end)

AddEventHandler("playerDropped",function()
	if blips[source] then
		blips[source] = nil
		TriggerClientEvent("blips:updateBlips",-1,blips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('estoque',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.") 
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ADICIONAR CARRO ]--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local nplayer = args[1]
	local nplayerid = vRP.getUserId(nplayer)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then 
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/add_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[2].."</b> para o Passaporte: <b>"..parseInt(args[1]).."</b>.") 
			
			local nomeCar = args[2]
			local quantCar = parseInt(args[1])

			PerformHttpRequest(webhookaddrem, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE ESTOQUE:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = ""
						}, 
						fields = {
							{ 
								name = "**Quem adicionou:**", 
								value = "` "..identity.name.." "..identity.firstname.."  " .. user_id .. "` "
							},
							{ 
								name = "**Nº de Passaporte:**", 
								value = "` "..user_id.." ` "
							},
							{ 
								name = "**Carro adicionado:**", 
								value = "` "..nomeCar.." ` "
							},
							{ 
								name = "**Quantidade adicionada:**", 
								value = "` "..quantCar.." `\n⠀"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "" 
						},
						color = 15914080 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			

        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ REMOVER CARRO ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('remcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = args[1]
	local nplayerid = vRP.getUserId(nplayer)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/rem_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], ipva = parseInt(os.time())  }) 
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[2].."</b> do Passaporte: <b>"..parseInt(args[1]).."</b>.") 
			
				local nomeCar = args[2]
				local quantCar = parseInt(args[1])

			PerformHttpRequest(webhookaddrem, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE ESTOQUE:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = ""
						}, 
						fields = {
							{ 
								name = "**Quem removeu:**", 
								value = "` "..identity.name.." "..identity.firstname.."  " .. user_id .. " ` "
							},
							{ 
								name = "**Nº de Passaporte:**", 
								value = "` "..user_id.." ` "
							},
							{ 
								name = "**Carro removido:**", 
								value = "` "..nomeCar.." ` "
							},
							{ 
								name = "**Quantidade removida:**", 
								value = "` "..quantCar.." `\n⠀"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "" 
						},
						color = 15914080 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FESTINHA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('festinha',function(source,args,rawCommand) 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"event.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 0.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(7000,function()
            vRPclient.removeDiv(-1,"festinha")
        end)
	end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('estoque',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o veículo <b>"..args[1].."</b>.") 
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RDV
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rdv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nuser_id = vRP.getUserSource(parseInt(args[1]))
    if vRP.hasPermission(user_id,"trust.permissao") then
        local vehicle = vRPclient.getNearestVehicle(nuser_id,2)
        if vehicle then
            TriggerClientEvent('deletarveiculo',nuser_id,vehicle)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('idp',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,5)
    if nplayer then
        local nuser_id = vRP.getUserId(nplayer)
        TriggerClientEvent("Notify",source,"importante","Jogador próximo: "..nuser_id..".")
    else
        TriggerClientEvent("Notify",source,"aviso","Nenhum Jogador Próximo")
		end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MATAR
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('matar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.setHealth(nplayer,1)
            end
        else
            vRPclient.setHealth(source,10)
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UNCUFF
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("admcuff",source)
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SYNCAREA
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpararea',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") then
        TriggerClientEvent("syncarea",-1,x,y,z)
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RAIOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('raios', function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"admin.permissao") and args[1] ~= nil then
            local vezes = tonumber(args[1])
            TriggerClientEvent("cloud:raios",-1,vezes)           
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TROCAR SEXO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2])
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
            end
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("ToggleDebug",player)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") or vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"conce.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('deletarveiculo',source,vehicle)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEOBJ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
    TriggerClientEvent("syncdeleteobj",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local vehicle = vRPclient.getNearestVehicle(source,11)
	if vehicle then
		if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
			TriggerClientEvent('reparar',source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('god',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.killGod(nplayer)
                vRPclient.setHealth(nplayer,400)
                TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
                SendWebhookMessage(webhookgod,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU GOD EM]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            end
        else
            vRPclient.killGod(source)
            vRPclient.setHealth(source,400)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('godall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
				print(id)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		TriggerClientEvent('vehtuning',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wl',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
        if args[1] then
            vRP.setWhitelisted(parseInt(args[1]),true)
            TriggerClientEvent("Notify",source,"sucesso","Voce aprovou o passaporte <b>"..args[1].."</b> na whitelist.")
            SendWebhookMessage(webhookwl,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APROVOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"mod.permissao")  then
		if args[1] then
			vRP.setWhitelisted(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce retirou o passaporte <b>"..args[1].."</b> da whitelist.")
			SendWebhookMessage(webhookwl,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
				vRP.kick(id,"Você foi expulso da cidade.")
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
				SendWebhookMessage(webhookkick,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KICKOU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kickall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
				vRP.kick(id,"Você foi vitima do terremoto.")
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),true)
			TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(webhookban,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[BANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(webhookban,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESBANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			vRP.giveMoney(user_id,parseInt(args[1]))
			SendWebhookMessage(webhookmoney,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FEZ]: $"..vRP.format(parseInt(args[1])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		vRPclient.toggleNoclip(source)
        SendWebhookMessage(webhooknctp,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU]: NC"..vRP.format(parseInt(args[1])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",x..","..y..","..z)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local x,y,z = vRPclient.getPosition(source)
        
        SendWebhookMessage(webhookcds,"```prolog\n[PASSAPORTE]: "..user_id.." \n[CDS]: "..tD(x)..", "..tD(y)..", "..tD(z).." , \r```")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cdsh',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local x,y,z = vRPclient.getPosition(source)
        local lugar = vRP.prompt(source,"Lugar:","")
        if lugar == "" then
            return
        end
        SendWebhookMessage(webhookcds,"```prolog\n[PASSAPORTE]: "..user_id.." \n[LUGAR]: "..lugar.." \n[CDSH]: ['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z)..", ['name'] = "..lugar..", \r```")
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS CORRIDAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("cds:corridas")
AddEventHandler("cds:corridas",function()
local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		SendWebhookMessage(webhookcds,"```prolog\n[] = { ['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z).." }, \r```")
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		TriggerClientEvent('tptoway',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"vendedor.permissao") then
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
			SendWebhookMessage(webhookcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MENSAGEM]: "..mensagem.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
		SetTimeout(60000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pon',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
        local users = vRP.getUsers()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,160,0},quantidade)
        TriggerClientEvent('chatMessage',source,"ID's ONLINE",{255,160,0},players)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP FACS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addballas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderballas.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Ballas \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Ballas")
		end
	end
end)

RegisterCommand('removeballas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderballas.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Ballas \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Ballas")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addvagos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidervagos.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Vagos \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Vagos")
		end
	end
end)

RegisterCommand('removevagos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidervagos.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Vagos \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Vagos")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcoscosanostra',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidercoscosanostra.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Coscosanostra \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Cosanostra")
		end
	end
end)

RegisterCommand('removecoscosanostra',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidercoscosanostra.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Coscosanostra \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Cosanostra")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addfamilies',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderfamilies.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Families \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Families")
		end
	end
end)

RegisterCommand('removefamilies',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderfamilies.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Families \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Families")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addpolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Policia \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Policia")
		end
	end
end)

RegisterCommand('removepolicia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderpolicia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Policia \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Policia")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaPolicia")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addnews',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidernews.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: News \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"News")
		end
	end
end)

RegisterCommand('removenews',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidernews.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: News \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"News")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addmafia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidermafia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Mafia \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Mafia")
		end
	end
end)

RegisterCommand('removemafia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidermafia.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Mafia \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Mafia")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addbratva',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderbratva.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Bratva \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Yakuza")
		end
	end
end)

RegisterCommand('removebratva',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderbratva.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Bratva/Yakuza \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Yakuza")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addmotoclub',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidermotoclub.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Motoclub \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Motoclub")
		end
	end
end)

RegisterCommand('removemotoclub',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"lidermotoclub.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Motoclub \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Motoclub")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addparamedico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Paramedico \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Paramedico")
		end
	end
end)

RegisterCommand('removeparamedico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderparamedico.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Paramedico \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Paramedico")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaParamedico")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addmecanico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"mecanicolider.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Mecanico \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Mecanico")
		end
	end
end)

RegisterCommand('removemecanico',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"mecanicolider.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Mecanico \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Mecanico")
			vRP.removeUserGroup(parseInt(args[1]),"PaisanaMecanico")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addserpentes',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderserpentes.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]:"..parseInt(args[1]).." \n[GRUPO]: Serpentes \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.addUserGroup(parseInt(args[1]),"Serpentes")
		end
	end
end)

RegisterCommand('removeserpentes',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"liderserpentes.permissao") then
		if args[1] then
			SendWebhookMessage(webhookfac,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[Removeu]:"..parseInt(args[1]).." \n[GRUPO]: Serpentes \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
			vRP.removeUserGroup(parseInt(args[1]),"Serpentes")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('festa',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"convite.permissao") then
	    if user_id then
	        local fcoords = vRP.prompt(source,"Quer ir para o festa?(Digite: SIM)","")
	        if fcoords ~= "SIM" or "sim" then
	            return
	        end
	        vRPclient.teleport(source,-182.75,969.12,236.13)	       
	    end
	    vRP.removeUserGroup(user_id, "Convite")
	end
end)

RegisterCommand('convidar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)	
	if args[1] then
		vRP.addUserGroup(parseInt(args[1]),"Convite")
		SendWebhookMessage(webhookconvite,"```css\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CONVIDOU]:"..parseInt(args[1]).." \n[FESTA]: Magnum \nData e Hora : "..os.date("%d/%m/%Y %H:%M:%S").." \r```")
	end		
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR INVENTARIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limparinv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"god.permissao") then
        vRP.clearInventory(user_id)
        TriggerClientEvent("Notify",source,"importante","Seu <b>inventario</b> foi limpo.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PUXAR TODOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpall', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local rusers = vRP.getUsers()
        for k,v in pairs(rusers) do
            local rsource = vRP.getUserSource(k)
            if rsource ~= source then
                vRPclient.teleport(rsource,x,y,z)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNAR ARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
local qtdAmmunition = 250
local qtdWeapon = 1

local itemlist = {
    ["WEAPON_PISTOL_MK2"] = { arg = "fiveseven" },
    ["WEAPON_ASSAULTSMG"] = { arg = "mtar21" },
	["WEAPON_ASSAULTRIFLE"] = { arg = "ak103" },
	["WEAPON_SMG"] = { arg = "mp5" },
	["WEAPON_REVOLVER"] = { arg = "revolver" },
	["WEAPON_COMBATPDW"] = { arg = "mpx" },
	["WEAPON_COMBATPISTOL"] = { arg = "glock" },
	["WEAPON_ASSAULTRIFLE"] = { arg = "ak" } ,
	["WEAPON_CARBINERIFLE"] = { arg = "imbel" },
	["WEAPON_KNIFE"] = { arg = "faca" },
	["WEAPON_PISTOL"] = { arg = "pistola" },
	["WEAPON_FLASHLIGHT"] = { arg = "lanterna" }
}

RegisterCommand('arma',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] then
            for k,v in pairs(itemlist) do
                if v.arg == args[1] then
                    arma = 'wbody|'..k
                    municao = 'wammo|'..k
                    vRP.giveInventoryItem(user_id,arma,parseInt(qtdWeapon))
                    vRP.giveInventoryItem(user_id,municao,parseInt(qtdAmmunition))
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Pegar IP De Hacker
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pegarip',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local tplayer = vRP.getUserSource(parseInt(args[1]))
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and tplayer then
        TriggerClientEvent('chatMessage',source,"^1IP do Usuário: "..GetPlayerEndpoint(tplayer))
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /KILL 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kill',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                vRPclient.killGod(nplayer)
                vRPclient.setHealth(nplayer,0)
            end
        else
            vRPclient.killGod(source)
            vRPclient.setHealth(source,0)
            vRPclient.setArmour(source,0)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Ver Quantos Tem ON!
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ponpm',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local users = vRP.getUsersByPermission("policia.permissao")
        TriggerClientEvent('chatMessage',source,"PMs ONLINE",{255,160,0},users)
    end
end)

RegisterCommand('ponadm',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
        local users = vRP.getUsersByPermission("admin.permissao")
        TriggerClientEvent('chatMessage',source,"ADMs ONLINE",{255,160,0},users)
end)

RegisterCommand('ponsamu',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local users = vRP.getUsersByPermission("paramedico.permissao")
        TriggerClientEvent('chatMessage',source,"PARAMEDICOS ONLINE",{255,160,0},users)
    end
end)