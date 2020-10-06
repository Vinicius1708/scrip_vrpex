local discord_webhook = "https://discordapp.com/api/webhooks/751267542647046155/JPE5j0KgR83TLSYGDxgwrukqBpT7N9gHktstnf-Tlm4V6IqQjRpL-rC7jUGXrKmT9jhf"
local discord_webhook1 = "https://discordapp.com/api/webhooks/751267260294758472/fWQkWdPI_IkBDN7lnnwdjoVL5ACFSdGBk_-2VdYZIyjRsYddrfI96symPD1VKUEmOEfV"
local discord_webhook2 = "https://discordapp.com/api/webhooks/751267090865848443/yVSaj-Z_A9-HpV6G7_ZQqqyvwRpgNo4Wlp5fGsObwGNS94UvWceMRnA3x3fS2SnTtLyQ"
local discord_webhook3 = "https://discordapp.com/api/webhooks/751268780818169856/wabUlK1cWb1yqCdlvloHnQtVmTZ7KrvdMAMMMx72_UruKoItnBLvVq8Pb7UrapgsUwTY"
local discord_webhook5 = "https://discordapp.com/api/webhooks/751266790759202828/PsGlaPC1v5_MGjdLSECJ9QZjdlxPz4ZFJpRv1hX0Y87g9DC2PPDmAf4t3h-Ktb6vTt4r"
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["ferramenta"] = { index = "ferramenta", nome = "Ferramenta" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite" },
	["roupas"] = { index = "roupas", nome = "Roupas" },
	["tora"] = { index = "tora", nome = "Tora de Madeira" },
	["alianca"] = { index = "alianca", nome = "Aliança" },
	["bandagem"] = { index = "bandagem", nome = "Bandagem" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja" },
	["tequila"] = { index = "tequila", nome = "Tequila" },
	["vodka"] = { index = "vodka", nome = "Vodka" },
	["rpprotecao"] = { index = "coletemedico", nome = "Colete Médico" },
	["whisky"] = { index = "whisky", nome = "Whisky" },
	["colete"] = { index = "colete", nome = "Colete Balístico" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque" },
	["nitro"] = { index = "nitro", nome = "nitro" },
	["carteira"] = { index = "carteira", nome = "Dinheiro na Carteira" },
	["absinto"] = { index = "absinto", nome = "Absinto" },
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["rastreador"] = { index = "rastreador", nome = "Rastreador" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["algemas"] = { index = "algemas", nome = "Algemas" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick" },
	["militec"] = { index = "militec", nome = "Militec-1" },
	["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão" },
	["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo" },
	["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia" },
	["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo" },
	["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho" },
	["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote" },
	["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo" },
	["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma" },
	["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali" },
	["isca"] = { index = "isca", nome = "Isca" },
	["dourado"] = { index = "dourado", nome = "Dourado" },
	["corvina"] = { index = "corvina", nome = "Corvina" },
	["salmao"] = { index = "salmao", nome = "Salmão" },
	["pacu"] = { index = "pacu", nome = "Pacu" },
	["pintado"] = { index = "pintado", nome = "Pintado" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré" },
	["lambari"] = { index = "lambari", nome = "Lambari" },
	["energetico"] = { index = "energetico", nome = "Energético" },
	["mochila"] = { index = "mochila", nome = "Mochila" },
	
	["graos"] = { index = "graos", nome = "Grãos" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Grãos Impuros" },

	["adubo"] = { index = "adubo", nome = "Adubo" },
	["cannabis"] = { index = "cannabis", nome = "Cannabis" },
	["maconha"] = { index = "maconha", nome = "Maconha" },

	["mouro"] = { index = "ouro", nome = "Ouro" },
	["mbronze"] = { index = "bronze", nome = "Bronze" },
	["mferro"] = { index = "ferro", nome = "Ferro" },
	["mrubi"] = { index = "rubi", nome = "Rubi" },
	["mesmeralda"] = { index = "esmeralda", nome = "Esmeralda" },
	["diamante"] = { index = "diamante", nome = "Diamante" },

	["agua"] = { index = "agua", nome = "Água" },
	["limonada"] = { index = "limonada", nome = "Limonada" },
	["refrigerante"] = { index = "refrigerante", nome = "Refrigerante" },
	["cafe"] = { index = "cafe", nome = "Café" },
	["pao"] = { index = "pao", nome = "Pão" },
	["chocolate"] = { index = "chocolate", nome = "chocolate" },
	["salgadinho"] = { index = "salgadinho", nome = "salgadinho" },
	["rosquinha"] = { index = "rosquinha", nome = "rosquinha" },
	["sanduiche"] = { index = "sanduiche", nome = "sanduiche" },
	["pizza"] = { index = "pizza", nome = "pizza" },

	["pseudoefedrina"] = { index = "pseudoefedrina", nome = "Pseudoefedrina" },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina" },
	["ritalina"] = { index = "ritalina", nome = "Ritalina" },
	["metasuja"] = { index = "metasuja", nome = "Metanfetamina Suja" },
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina" },
	
	["cocaina"] = { index = "cocaina", nome = "Cocaína" },
	["acetofenetidina"] = { index = "acetofenetidina", nome = "Acetofenetidina" },
	["benzoilecgonina"] = { index = "benzoilecgonina", nome = "Benzoilecgonina" },
	["cloridratoecgonina"] = { index = "cloridratoecgonina", nome = "Cloridratoecgonina" },
	["cloridratococa"] = { index = "cloridrato", nome = "Cloridratococa" },
	["pastadecoca"] = { index = "pastadecoca", nome = "Pasta de Cocaina" },

	["placa"] = { index = "placa", nome = "Placa" },
	["rebite"] = { index = "rebite", nome = "Rebite" },
	["carbono"] = { index = "carbono", nome = "Carbono" },
	["ferro"] = { index = "ferro", nome = "Ferro" },
	["aco"] = { index = "aco", nome = "Aço" },
	["capsula"] = { index = "capsula", nome = "Cápsula" },
	["polvora"] = { index = "polvora", nome = "Pólvora" },
	["orgao"] = { index = "orgao", nome = "Órgão" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira" },
	["bombaadesiva"] = { index = "bombaadesiva", nome = "Bomba Adesiva" },
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive" },
	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado" },
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada" },
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado" },
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado" },
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado" },
	["carteiraroubada"] = { index = "carteiraroubada", nome = "Carteira Roubada" },
	["carregadorroubado"] = { index = "carregadorroubado", nome = "Carregador Roubado" },
	["tabletroubado"] = { index = "tabletroubado", nome = "Tablet Roubado" },
	["sapatosroubado"] = { index = "sapatosroubado", nome = "Sapatos Roubado" },
	["vibradorroubado"] = { index = "vibradorroubado", nome = "Vibrador Roubado" },
	["perfumeroubado"] = { index = "perfumeroubado", nome = "Perfume Roubado" },
	["maquiagemroubada"] = { index = "maquiagemroubada", nome = "Maquiagem Roubada" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
	["wbody|WEAPON_SPECIALCARBINE"] = { index = "parafall", nome = "Parafall" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody|WEAPON_PISTOL"] = { index = "m1911", nome = "M1911" },
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven" },
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19" },
	["wbody|WEAPON_APPISTOL"] = { index = "vp9", nome = "Koch VP9" },
	["wbody|WEAPON_STUNGUN"] = { index = "tazer", nome = "Tazer" },
	["wbody|WEAPON_SNSPISTOL"] = { index = "hkp7m10", nome = "HK P7M10" },
	["wbody|WEAPON_VINTAGEPISTOL"] = { index = "m1922", nome = "M1922" },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44" },
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["celular"] = { index = "celular", nome = "Celular" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	["wbody|WEAPON_MICROSMG"] = { index = "uzi", nome = "Uzi" },
	["wbody|WEAPON_SMG"] = { index = "mp5", nome = "MP5" },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mtar21", nome = "MTAR-21" },
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX" },
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	["wbody|WEAPON_SAWNOFFSHOTGUN"] = { index = "shotgun", nome = "Shotgun" },
	["wammo|WEAPON_SAWNOFFSHOTGUN"] = { index = "m-shotgun", nome = "Munição de Shotgun" },
	["wbody|WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9" },
	["wammo|WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "Munição de Tec-9" },
	["wbody|WEAPON_CARBINERIFLE"] = { index = "imbel", nome = "Imbel IA2" },
	["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak103", nome = "AK-103" },
	["wbody|WEAPON_GUSENBERG"] = { index = "thompson", nome = "Thompson" },
	["wammo|WEAPON_PISTOL"] = { index = "m-m1911", nome = "Munição de M1911" },
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "Munição de FN Five Seven" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "Munição de Glock 19" },
	["wammo|WEAPON_APPISTOL"] = { index = "m-vp9", nome = "Munição de Koch VP9" },
	["wammo|WEAPON_STUNGUN"] = { index = "m-tazer", nome = "Munição de Tazer" },
	["wammo|WEAPON_SNSPISTOL"] = { index = "m-hkp7m10", nome = "Munição de HK P7M10" },
	["wammo|WEAPON_VINTAGEPISTOL"] = { index = "m-m1922", nome = "Munição de M1922" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "Munição de Magnum 44" },
	["wammo|WEAPON_SPECIALCARBINE"] = { index = "m-parafall", nome = "Munição de Parafall" },
	["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "Munição de Winchester 22" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "Munição de Sinalizador" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "Munição de Paraquedas" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "Munição de Extintor" },
	["wammo|WEAPON_MICROSMG"] = { index = "m-uzi", nome = "Munição de Imbel IA2" },
	["wammo|WEAPON_SMG"] = { index = "m-mp5", nome = "Munição de MP5" },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mtar21", nome = "Munição de MTAR-21" },
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "Munição de Sig Sauer MPX" },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "Munição de Remington 870" },
	["wammo|WEAPON_CARBINERIFLE"] = { index = "m-imbel", nome = "Munição de Imbel" },
	["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak103", nome = "Munição de AK-103" },
	["wammo|WEAPON_GUSENBERG"] = { index = "m-thompson", nome = "Munição de Thompson" },
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina" }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] and itemlist[args[1]] ~= nil then
			vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
			TriggerEvent('logs:ToDiscord', discord_webhook , "ABUSER", "```ADM "..user_id.." pegou o item: "..args[1].." Quantidade: "..args[2].."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GUARDAR COLETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gcolete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local armour = vRPclient.getArmour(player)
	if armour > 95 then
       vRPclient.setArmour(source,0)
       vRP.giveInventoryItem(user_id,"colete",1,true)
       TriggerClientEvent("tirandocolete",player)
       TriggerClientEvent("Notify",source,"sucesso","Você guardou o seu <b>Colete</b>.")
    else
       TriggerClientEvent("Notify",source,"negado","<b>Coletes</b> danificados não podem ser <b>Guardados</b>.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JOGAR FORA O COLETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jcolete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local armour = vRPclient.getArmour(player)
	if armour < 95 then
       vRPclient.setArmour(source,0)
       TriggerClientEvent("tirandocolete",player)
       TriggerClientEvent("Notify",source,"sucesso","Você jogou fora o seu <b>Colete</b>.")
       vRPclient._playAnim(player,true,{{"pickup_object","pickup_low",1}},false)
    else
       TriggerClientEvent("Notify",source,"negado","Seu <b>Colete</b> nao está <b>Danificado</b>.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUG CRIAÇÃO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Instanced then
			for i=0, 255 do
				local otherPlayerPed = GetPlayerPed(i)
				
				if otherPlayerPed ~= PlayerPedId() then
					SetEntityLocallyInvisible(otherPlayerPed)
					SetEntityNoCollisionEntity(PlayerPedId(),  otherPlayerPed,  true)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /EQUIPAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('equipar',function(source,args,rawCommand)
	for k,v in pairs(itemlist) do
		if args[1] == v.index and args[1] ~= "mochila" then
			local user_id = vRP.getUserId(source)
			if vRP.tryGetInventoryItem(user_id,k,1) then
				local weapons = {}
				weapons[string.gsub(k,"wbody|","")] = { ammo = 0 }
				vRPclient._giveWeapons(source,weapons)
				vRP.logs("savedata/armamento.txt","[ID]: "..user_id.." / [FUNÇÃO]: Equipar / [ARMA]: "..v.index)
			else
				TriggerClientEvent("Notify",source,"negado","Armamento não encontrado.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('mascara',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de máscara.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLUSA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('blusa',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de blusa.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JAQUETA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('jaqueta',source,args[1],args[2])
	else
	TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de jaqueta.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- CALCA
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('calca',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de calça.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('maos',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de mãos.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACESSORIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('acessorios',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de acessórios.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- SAPATO
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('sapatos',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de sapatos.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('chapeu',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de chapéu.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OCULOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('oculos',source,args[1],args[2])
	else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de óculos.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /RECARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('recarregar',function(source,args,rawCommand)
	for k,v in pairs(itemlist) do
		if args[1] == v.index and args[1] ~= "mochila" then
			local uweapons = vRPclient.getWeapons(source)
			local weaponuse = string.gsub(k,"wbody|","")
			if uweapons[weaponuse] then
				local user_id = vRP.getUserId(source)
				if vRP.tryGetInventoryItem(user_id,"wammo|"..weaponuse,parseInt(args[2])) then
					local weapons = {}
					weapons[weaponuse] = { ammo = parseInt(args[2]) }
					vRPclient._giveWeapons(source,weapons,false)
					vRP.logs("savedata/armamento.txt","[ID]: "..user_id.." / [FUNÇÃO]: Recarregar / [ARMA]: "..v.index)
				else
					TriggerClientEvent("Notify",source,"negado","Munição não encontrada.")
				end
			else
				TriggerClientEvent("Notify",source,"importante","Equipe o armamento antes.")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /MOC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('moc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(user_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(user_id)).."kg^4  ]  - -")
			for k,v in pairs(data.inventory) do
				if k and v then
					TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."^2    |    "..itemlist[k].index)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /DROPAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dropar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		local px,py,pz = vRPclient.getPosition(source)
		for k,v in pairs(itemlist) do
			if args[1] == v.index then
				if args[2] and parseInt(args[2]) > 0 then
					if vRP.tryGetInventoryItem(user_id,k,parseInt(args[2])) then
						TriggerEvent("DropSystem:create",k,parseInt(args[2]),px,py,pz)
						vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
						vRP.logs("savedata/dropar.txt","[ID]: "..user_id.." / [ITEM]: "..k.." / [QTD]: "..parseInt(args[2]))
					end
				else
					local data = vRP.getUserDataTable(user_id)
					for i,o in pairs(data.inventory) do
						if itemlist[i].index == args[1] then
							if vRP.tryGetInventoryItem(user_id,k,parseInt(o.amount)) then
								TriggerEvent("DropSystem:create",k,parseInt(o.amount),px,py,pz)
								vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
								vRP.logs("savedata/dropar.txt","[ID]: "..user_id.." / [ITEM]: "..k.." / [QTD]: "..parseInt(o.amount))
							end
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
veiculos["CLONADOS"] = true
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AFKSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if not vRP.hasPermission(user_id,"admin.permissao") then
		DropPlayer(source,"Voce foi desconectado por ficar ausente.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /SEQUESTRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALERTAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('alertas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"alertas.permissao") then
		vRP.removeUserGroup(user_id,"Alertas")
		TriggerClientEvent("Notify",source,"importante","Você removeu as notificações.")
	else
		vRP.addUserGroup(user_id,"Alertas")
		TriggerClientEvent("Notify",source,"sucesso","Você ativou as notificações.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRATAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tratamento',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"paramedico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,3)
		if nplayer then
			TriggerClientEvent('tratamento',nplayer)
			TriggerClientEvent("Notify",nplayer,"sucesso","Tratamento iniciado, aguarde a liberação do paramédico.")
			TriggerClientEvent("Notify",source,"sucesso","Tratamento no paciente iniciado com sucesso.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CASAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('casas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if args[1] and vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRP.getUserSource(parseInt(args[1]))
		if nplayer == nil then
			return
		end
		user_id = vRP.getUserId(nplayer)
	end
	if user_id then
		local address = vRP.getUserAddress(user_id)
		local casas = ""
		if args[1] then
			if #address > 0 then
				for k,v in pairs(address) do
					casas = casas..v.home.." - Nº"..v.number
					if k ~= #address then
						casas = casas..", "
					end
				end
				TriggerClientEvent("Notify",source,"importante","Residências possuidas pelo passaporte <b>"..vRP.format(parseInt(args[1])).."</b>: "..casas)
			else
				TriggerClientEvent("Notify",source,"negado","Passaporte <b>"..vRP.format(parseInt(args[1])).."</b> não possui residências.")
			end
		else
			if #address > 0 then
				for k,v in pairs(address) do
					casas = casas..v.home.." - Nº"..v.number
					if k ~= #address then
						casas = casas..", "
					end
				end
				TriggerClientEvent("Notify",source,"importante","Residências possuidas: "..casas)
			else
				TriggerClientEvent("Notify",source,"importante","Não possui residências em seu nome.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('motor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if not vRPclient.isInVehicle(source) then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vRP.hasPermission(user_id,"mecanico.permissao") then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
			TriggerClientEvent("progress",source,30000,"reparando")
			SetTimeout(30000,function()
				TriggerClientEvent('cancelando',source,false)
				TriggerClientEvent('repararmotor',source,vehicle)
				vRPclient._stopAnim(source,false)
			end)
		else
			if vRP.tryGetInventoryItem(user_id,"militec",1) then
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
				TriggerClientEvent("progress",source,30000,"reparando")
				SetTimeout(30000,function()
					TriggerClientEvent('cancelando',source,false)
					TriggerClientEvent('repararmotor',source,vehicle)
					vRPclient._stopAnim(source,false)
				end)
			else
				TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Militec-1</b> para reparar o motor.")
			end
		end
	else
		TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
	end
end)

RegisterServerEvent("trymotor")
AddEventHandler("trymotor",function(nveh)
	TriggerClientEvent("syncmotor",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reparar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if not vRPclient.isInVehicle(source) then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vRP.hasPermission(user_id,"mecanico.permissao") then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
			TriggerClientEvent("progress",source,30000,"reparando")
			SetTimeout(30000,function()
				TriggerClientEvent('cancelando',source,false)
				TriggerClientEvent('reparar',source,vehicle)
				vRPclient._stopAnim(source,false)
			end)
		else
			if vRP.tryGetInventoryItem(user_id,"repairkit",1) then
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
				TriggerClientEvent("progress",source,30000,"reparando")
				SetTimeout(30000,function()
					TriggerClientEvent('cancelando',source,false)
					TriggerClientEvent('reparar',source,vehicle)
					vRPclient._stopAnim(source,false)
				end)
			else
				TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Kit de Reparos</b> para reparar o veículo.")
			end
		end
	else
		TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
	end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENVIAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id and args[1] and parseInt(args[2]) > 0 then
		for k,v in pairs(itemlist) do
			if args[1] == v.index then
				if vRP.getInventoryWeight(nuser_id)+vRP.getItemWeight(k)*parseInt(args[2]) <= vRP.getInventoryMaxWeight(nuser_id) then
					if vRP.tryGetInventoryItem(user_id,k,parseInt(args[2])) then
						vRP.giveInventoryItem(nuser_id,k,parseInt(args[2]))
						vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
						TriggerClientEvent("Notify",source,"sucesso","Enviou <b>"..parseInt(args[2]).."x "..v.nome.."</b>.")
						TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>"..parseInt(args[2]).."x "..v.nome.."</b>.")
						vRP.logs("savedata/enviar.txt","[ID]: "..user_id.." / [NID]: "..nuser_id.." / [ITEM]: "..k)
						TriggerEvent('logs:ToDiscord', discord_webhook3 , "ENVIAR", "```Player "..user_id.." enviou(por comando) o item: "..k.. " para o ID "..nuser_id.." [QTD]: "..args[2].."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
					end
				end
			end
		end
	elseif nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.")
			TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.")
			vRP.logs("savedata/enviar.txt","[ID]: "..user_id.." / [NID]: "..nuser_id.." / [VALOR]: "..parseInt(args[1]))
			TriggerEvent('logs:ToDiscord', discord_webhook3 , "ENVIAR", "```Player "..user_id.." enviou dinheiro para o ID "..nuser_id.." [R$]: "..args[1].."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
		else
			TriggerClientEvent("Notify",source,"negado","Não tem a quantia que deseja enviar.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})
		for k,v in pairs(weapons) do
			vRP.giveInventoryItem(user_id,"wbody|"..k,1)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
			end
		end
		TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLONEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cloneplate',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.isInVehicle(source) and vRP.tryGetInventoryItem(user_id,"placa",1) then
			TriggerClientEvent("cloneplates",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUBAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('roubar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia >= 1 then
			if vRP.request(nplayer,"Você está sendo roubado, deseja passar tudo?",30) then
				local vida = vRPclient.getHealth(nplayer)
				if vida <= 100 then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
					TriggerClientEvent("progress",source,30000,"roubando")
					SetTimeout(30000,function()
						local ndata = vRP.getUserDataTable(nuser_id)
						if ndata ~= nil then
							if ndata.inventory ~= nil then
								for k,v in pairs(ndata.inventory) do
									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
										if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
											vRP.giveInventoryItem(user_id,k,v.amount)
										end
									else
										TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."</b> por causa do peso.")
									end
								end
							end
						end
						local weapons = vRPclient.replaceWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..itemlist["wbody"..k].nome.."</b> por causa do peso.")
							end
							if v.ammo > 0 then
								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..itemlist["wammo|"..k].nome.."</b> por causa do peso.")
								end
							end
						end
						local nmoney = vRP.getMoney(nuser_id)
						if vRP.tryPayment(nuser_id,nmoney) then
							vRP.giveMoney(user_id,nmoney)
						end
						vRPclient.setStandBY(source,parseInt(600))
						vRPclient._stopAnim(source,false)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
						TriggerEvent('logs:ToDiscord', discord_webhook1 , "ROUBO", "```Player "..user_id.." roubou o ID: "..nuser_id.."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
					end)
				else
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										vRP.giveInventoryItem(user_id,k,v.amount)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."</b> por causa do peso.")
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..itemlist["wbody|"..k].nome.."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..itemlist["wammo|"..k].nome.."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRPclient.setStandBY(source,parseInt(600))
					TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
					TriggerEvent('logs:ToDiscord', discord_webhook1 , "ROUBO", "```Player "..user_id.." roubou o ID: "..nuser_id.."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
				end
			else
				TriggerClientEvent("Notify",source,"aviso","A pessoa está resistindo ao roubo.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Número insuficiente de policiais no momento.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WINS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('chamar',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	if user_id then
		local players = {}
		if args[1] == "190" then
			players = vRP.getUsersByPermission("policia.permissao")
		elseif args[1] == "192" then
			players = vRP.getUsersByPermission("paramedico.permissao")
		elseif args[1] == "mecanico" then
			players = vRP.getUsersByPermission("mecanico.permissao")
		elseif args[1] == "taxi" then
			players = vRP.getUsersByPermission("taxista.permissao")
		elseif args[1] == "god" then
			players = vRP.getUsersByPermission("admin.permissao")
		elseif args[1] == "advogado" then
			players = vRP.getUsersByPermission("advogado.permissao")
		else
			TriggerClientEvent("Notify",source,"negado","Serviço inexistente.")
			return
		end

		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			return
		end

		local identitys = vRP.getUserIdentity(user_id)
		TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")
		TriggerEvent('logs:ToDiscord', discord_webhook2 , "CHAMADO", "```Player: "..user_id.." \nFez um chamado para: "..args[1].."\nMensagem: "..descricao.."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
		for l,w in pairs(players) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			local x,y,z = vRPclient.getPosition(source)
			local uplayer = vRP.getUserSource(user_id)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},"Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0, "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"negado","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- P
-----------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('p',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5)
						TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Localização recebida de ^1"..identity.name.." "..identity.firstname.."^0.")
						TriggerClientEvent('InteractSound_CL:PlayOnOne',player,'beep',0.7)
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
		end
	end
end)
RegisterServerEvent('offred:qthPolice')
AddEventHandler('offred:qthPolice', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local typemessage = "info"
		local messagedesc = "Enviou sua localização para a central"
		vRPclient.setDiv(source, "local","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
		SetTimeout(5000,function()
			vRPclient.removeDiv(source,"local")
		end)
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player and player ~= uplayer then
				async(function()
					local id = idgens:gen()
					policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5)
					TriggerClientEvent('criarblipp',player,x,y,z, "Localização de "..identity.name.." "..identity.firstname)
					local typemessage = "info"
					local messagedesc = "Localização recebida de "..identity.name.." "..identity.firstname..""
					TriggerClientEvent('chatMessage',player,"COPOM",{65,130,255},"Localização recebida de ^1"..identity.name.." "..identity.firstname.."^0.")
					SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					vRPclient.setDiv(player, "local","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
					SetTimeout(5000,function()
						vRPclient.removeDiv(player,"local")
					end)
					TriggerClientEvent('InteractSound_CL:PlayOnOne',player,'beep',0.7)
					SetTimeout(30000,function() TriggerClientEvent('removerblipp',-1) end)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /INVENTÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------
local itemSelected = nil

function match(string, type, weapon)
    local string = string:match('^('..type..')(.)('..weapon..')')
    if string then
       return true
    else
       return false
    end
end

function buildInventory(source)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data.inventory then			
			local close_count = 0

			local use = function(player, choice)
				if itemlist[itemSelected].index == "bandagem" then
					vida = vRPclient.getHealth(source)
					if vida > 100 and vida < 400 then
						if bandagem[user_id] == 0 or not bandagem[user_id] then
							if vRP.tryGetInventoryItem(user_id,"bandagem",1) then
								TriggerClientEvent('cancelando',source,true)
								TriggerClientEvent("progress",source,10000,"bandagem")
								SetTimeout(10000,function()
									bandagem[user_id] = 60
									TriggerClientEvent('bandagem',source)
									TriggerClientEvent('cancelando',source,false)
									TriggerClientEvent("Notify",source,"sucesso","Bandagem utilizada com sucesso.")
								end)
							else
								TriggerClientEvent("Notify",source,"negado","Bandagem não encontrada na mochila.")
							end
						else
							TriggerClientEvent("Notify",source,"importante","Você precisa aguardar <b>"..bandagem[user_id].." segundos</b> para utilizar outra Bandagem.")
						end
					else
						TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.")
					end
				elseif itemlist[itemSelected].index == "cerveja" or itemlist[itemSelected].index == "tequila" or itemlist[itemSelected].index == "vodka" or itemlist[itemSelected].index == "agua" or itemlist[itemSelected].index == "conhaque" or itemlist[itemSelected].index == "absinto" then
					if vRP.tryGetInventoryItem(user_id,itemlist[itemSelected].index,1) then
						TriggerClientEvent('cancelando',source,true)
						vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
						TriggerClientEvent("progress",source,10000,"bebendo")
						SetTimeout(10000,function()
							vRPclient.playScreenEffect(source,"RaceTurbo",180)
							vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
							TriggerClientEvent('cancelando',source,false)
							vRPclient._DeletarObjeto(source)
							TriggerClientEvent("Notify", source, "sucesso", itemlist[itemSelected].nome.." utilizado com sucesso.")	
						end)
					else
						TriggerClientEvent("Notify", source, "negado", itemlist[itemSelected].nome.." utilizado com sucesso.")	
					end
				elseif itemlist[itemSelected].index == "whisky" then
					if vRP.tryGetInventoryItem(user_id,"whisky",1) then
						TriggerClientEvent('cancelando',source,true)
						vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
						TriggerClientEvent("progress",source,10000,"bebendo")
						SetTimeout(10000,function()
							vRPclient.playScreenEffect(source,"RaceTurbo",180)
							vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
							TriggerClientEvent('cancelando',source,false)
							vRPclient._DeletarObjeto(source)
							TriggerClientEvent("Notify", source,"sucesso", itemlist[itemSelected].nome.." utilizado com sucesso.")	
						end)
					else
						TriggerClientEvent("Notify", source, "negado", itemlist[itemSelected].nome.." utilizado com sucesso.")	
					end
				elseif itemlist[itemSelected].index == "maconha" then
					if vRP.tryGetInventoryItem(user_id,"maconha",1) then
						vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
						TriggerClientEvent("progress",source,10000,"fumando")
						SetTimeout(10000,function()
							vRPclient._stopAnim(source,false)
							vRPclient.playScreenEffect(source,"RaceTurbo",180)
							vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
							TriggerClientEvent("Notify",source,"sucesso","Maconha utilizada com sucesso.")
						end)
					else
						TriggerClientEvent("Notify",source,"negado","Maconha não encontrada na mochila.")
					end
				elseif itemlist[itemSelected].index == "rebite" or itemlist[itemSelected].index == "energetico" then
					if vRP.tryGetInventoryItem(user_id,itemlist[itemSelected].index,1) then
						TriggerClientEvent('cancelando',source,true)
						vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
						TriggerClientEvent("progress",source,10000,"bebendo")
						SetTimeout(10000,function()
							vRPclient.playScreenEffect(source,"RaceTurbo",180)
							vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
							TriggerClientEvent('energeticos',source,true)
							TriggerClientEvent('cancelando',source,false)
							vRPclient._DeletarObjeto(source)
							TriggerClientEvent("Notify",source,"sucesso", itemlist[itemSelected].nome.." utilizado com sucesso.")
						end)
						SetTimeout(60000,function()
							TriggerClientEvent('energeticos',source,false)
							TriggerClientEvent("Notify",source,"aviso","O efeito do "..itemlist[itemSelected].nome.." passou e o coração voltou a bater normalmente.")
						end)
					else
						TriggerClientEvent("Notify",source,"negado","Rebite não encontrado na mochila.")
					end
				elseif itemlist[itemSelected].index == "capuz" then
					if vRP.getInventoryItemAmount(user_id,"capuz") >= 1 then
						local nplayer = vRPclient.getNearestPlayer(source,2)
						if nplayer then
							vRPclient.setCapuz(nplayer)
							vRP.closeMenu(nplayer)
							TriggerClientEvent("Notify",source,"sucesso","Capuz utilizado com sucesso.")
						end
					else
						TriggerClientEvent("Notify",source,"negado","Capuz não encontrado na mochila.")
					end
				elseif itemlist[itemSelected].index == "lockpick" then
					local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
					local mPlacaUser = vRP.getUserByRegistration(mPlaca)
					if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 and mName then
						if vRP.hasPermission(user_id,"policia.permissao") then
							TriggerClientEvent("syncLock",-1,mNet)
							return
						end
						TriggerClientEvent('cancelando',source,true)
						vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
						TriggerClientEvent("progress",source,30000,"roubando")
						SetTimeout(30000,function()
							TriggerClientEvent('cancelando',source,false)
							vRPclient._stopAnim(source,false)
							if not mPlacaUser then
								TriggerClientEvent("syncLock",-1,mNet)
								TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
							else
								if math.random(100) >= 80 then
									TriggerClientEvent("syncLock",-1,mNet)
									TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
								else
									TriggerClientEvent("Notify",source,"negado","Roubo do veículo falhou e as autoridades foram acionadas.")
									local policia = vRP.getUsersByPermission("policia.permissao")
									for k,v in pairs(policia) do
										local player = vRP.getUserSource(parseInt(v))
										if player then
											async(function()
												local id = idgens:gen()
												TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
												pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
												SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
											end)
										end
									end
								end
							end
						end)
					else
						TriggerClientEvent("Notify",source,"negado","Precisa de uma <b>Lockpick</b> para iniciar o roubo do veículo.")
					end
				elseif itemlist[itemSelected].index == "masterpick" then
					local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
					local mPlacaUser = vRP.getUserByRegistration(mPlaca)
					if vRP.getInventoryItemAmount(user_id,"masterpick") >= 1 and mName then			
						if vRP.hasPermission(user_id,"policia.permissao") then
							TriggerClientEvent("syncLock",-1,mNet)
							return
						end			
						TriggerClientEvent('cancelando',source,true)
						vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
						TriggerClientEvent("progress",source,60000,"roubando")			
						SetTimeout(60000,function()
							TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent("syncLock",-1,mNet)
							vRPclient._stopAnim(source,false)			
							local policia = vRP.getUsersByPermission("policia.permissao")
							for k,v in pairs(policia) do
								local player = vRP.getUserSource(parseInt(v))
								if player then
									async(function()
										local id = idgens:gen()
										TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
										pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
										SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
									end)
								end
							end
						end)
					else
						TriggerClientEvent("Notify",source,"negado","Precisa de uma <b>Masterpick</b> para iniciar o roubo do veículo.")
					end
				end
			end
	
			local drop = function(player, choice)
				local user_id = vRP.getUserId(source)
				local px,py,pz = vRPclient.getPosition(source)
				local quantity = vRP.prompt(source, "Quantidade:","")
				if quantity == "" or tonumber(quantity) <= 0 then
					TriggerClientEvent("Notify", source, "aviso", "Quantidade invalida!")
					vRP.closeMenu(player, submenu)
				else
					if match(itemSelected, "wammo", string.gsub(itemSelected, "wammo|", "")) then
						if vRP.getInventoryItemAmount(user_id, "wammo|"..string.gsub(itemSelected,"wammo|","")) >= tonumber(quantity) then
							if vRP.tryGetInventoryItem(user_id, "wammo|"..string.gsub(itemSelected,"wammo|",""), tonumber(quantity)) then
								TriggerEvent("DropSystem:create", "wammo|"..string.gsub(itemSelected,"wammo|",""), tonumber(quantity), px, py, pz)
								vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
							end
						else
							TriggerClientEvent("Notify", source, "negado", "Você não tem essa quantidade do item "..itemlist[itemSelected].nome..".")
						end
					elseif match(itemSelected, "wbody", string.gsub(itemSelected, "wbody|", "")) then
						if vRP.getInventoryItemAmount(user_id, "wbody|"..string.gsub(itemSelected,"wbody|","")) >= tonumber(quantity) then
							if vRP.tryGetInventoryItem(user_id, "wbody|"..string.gsub(itemSelected,"wbody|",""), tonumber(quantity)) then
								TriggerEvent("DropSystem:create", "wbody|"..string.gsub(itemSelected,"wbody|",""), tonumber(quantity), px, py, pz)
								vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
							end
						else
							TriggerClientEvent("Notify", source, "negado", "Você não tem essa quantidade do item "..itemlist[itemSelected].nome..".")
						end
					else
						if vRP.getInventoryItemAmount(user_id, itemlist[itemSelected].index) >= tonumber(quantity) then
							if vRP.tryGetInventoryItem(user_id, itemlist[itemSelected].index, tonumber(quantity)) then
								TriggerEvent("DropSystem:create", itemlist[itemSelected].index, tonumber(quantity), px, py, pz)
								vRPclient._playAnim(source,true,{{"pickup_object","pickup_low"}},false)
							end
						else
							TriggerClientEvent("Notify", source, "negado", "Você não tem essa quantidade do item "..itemlist[itemSelected].nome..".")
						end
					end
					vRP.closeMenu(player, submenu)
				end
			end
			
			
			local equip = function(player, choice)				
				local weapon = string.gsub(itemSelected,"wbody|","") 
				local ammo = vRP.getInventoryItemAmount(user_id, "wammo|"..string.gsub(itemSelected,"wbody|",""))				
				if ammo >= 0 then
					local question = vRP.prompt(source, "Deseja equipar as munições também ? (Sim ou Não)","")
				else
					question = nil				
				end
				if question == "Sim" or question == "sim" then
					if ammo >= 1 then
						if vRP.tryGetInventoryItem(user_id,"wammo|"..string.gsub(itemSelected,"wbody|",""), ammo) then
							ammoset = ammo
							TriggerClientEvent("Notify", source, "sucesso", "Munições coletadas com sucesso.")
						end
					else
						TriggerClientEvent("Notify", source, "negado", "Você não possui munição!")
					end
				elseif question == "Não" or question == "Nao" or question == "nao" or question == "não" then
					ammoset = 0
				else
					ammoset = 0
				end
				local weapons = {}
				if vRP.tryGetInventoryItem(user_id,itemSelected,1) then
					weapons[string.gsub(itemSelected,"wbody|","")] = { ammo = ammoset }
					vRPclient._giveWeapons(player,weapons)
					vRP.logs("savedata/armamento.txt","[ID]: "..user_id.." / [FUNÇÃO]: Equipar / [ARMA]: "..itemlist[itemSelected].index)
					TriggerClientEvent("Notify", source, "sucesso", itemlist[itemSelected].nome.." equipado com sucesso.")	
				end				
				vRP.closeMenu(player, submenu)
			end
			
			local send = function(player, choice)
				local user_id = vRP.getUserId(source)
				local nplayer = vRPclient.getNearestPlayer(source, 2)
				local nuser_id = vRP.getUserId(nplayer)
				local quantity = vRP.prompt(source, "Quantidade:","")
				if nuser_id and itemlist[itemSelected].index and parseInt(quantity) > 0 then
					for k,v in pairs(itemlist) do
						if itemlist[itemSelected].index == v.index then
							if vRP.getInventoryWeight(nuser_id)+vRP.getItemWeight(k)*parseInt(quantity) <= vRP.getInventoryMaxWeight(nuser_id) then
								if vRP.tryGetInventoryItem(user_id,k,parseInt(quantity)) then
									vRP.giveInventoryItem(nuser_id,k,parseInt(quantity))
									vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
									TriggerClientEvent("Notify",source,"sucesso","Enviou <b>"..parseInt(quantity).."x "..v.nome.."</b>.")
									TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>"..parseInt(quantity).."x "..v.nome.."</b>.")
									vRP.logs("savedata/enviar.txt","[ID]: "..user_id.." / [NID]: "..nuser_id.." / [ITEM]: "..k)
								end
							end
						end
					end			
				end
			end

			local reload = function(player, choice)
				local uweapons = vRPclient.getWeapons(source)
				local weaponuse = string.gsub(itemSelected,"wammo|","")
				if uweapons[weaponuse] then
					local user_id = vRP.getUserId(source)
					local ammo = vRP.getInventoryItemAmount(user_id, itemSelected)
					local quantity = vRP.prompt(source, "Quantidade:","")
					if tonumber(quantity) == nil or quantity == "" then
						if vRP.tryGetInventoryItem(user_id, itemSelected, ammo) then
							local weapons = {}
							weapons[weaponuse] = {ammo = ammo}
							vRPclient._giveWeapons(source,weapons,false)
							vRP.logs("savedata/armamento.txt", "[ID]: "..user_id.." / [FUNÇÃO]: Recarregar / [ARMA]: "..itemSelected)
						else
							TriggerClientEvent("Notify",source,"negado","Munição não encontrada.")
						end
					elseif ammo < tonumber(quantity) or tonumber(quantity) <= 0 then
						TriggerClientEvent("Notify",source,"negado","Você tem apenas <b>"..ammo.."</b> balas.")
					else					
						if vRP.tryGetInventoryItem(user_id, itemSelected, parseInt(quantity)) then
							local weapons = {}
							weapons[weaponuse] = {ammo = parseInt(quantity)}
							vRPclient._giveWeapons(source,weapons, false)
							vRP.logs("savedata/armamento.txt", "[ID]: "..user_id.." / [FUNÇÃO]: Recarregar / [ARMA]: "..itemSelected)
						else
							TriggerClientEvent("Notify",source,"negado","Munição não encontrada.")
						end
					end
				else
					TriggerClientEvent("Notify",source,"importante","Equipe o armamento antes.")
				end
				vRP.closeMenu(player, submenu)
			end

			local bag = function(player, choice)
				if vRP.tryGetInventoryItem(user_id,"mochila",1) then
					vRP.varyExp(user_id,"physical","strength",650)
					TriggerClientEvent("Notify",source,"sucesso","Mochila utilizada com sucesso.")
				else
					TriggerClientEvent("Notify",source,"negado","Mochila não encontrada na mochila.")
				end
				vRP.closeMenu(player, submenu)
			end

			local item = function(player, choice)
				itemSelected = choice
				for key,value in pairs(itemlist) do
					if value.nome == choice then
						itemSelected = key
						label = value.nome
						local submenu = {}
						if match(key, "wbody", string.gsub(key, "wbody|", "")) then
							submenu = {name=value.nome}	
							submenu["Equipar"] = {equip, "<text01 style='width: 200px;'>Equipar item</text01>"}
						elseif match(key, "wammo", string.gsub(key,"wammo|","")) then
							submenu = {name="Munição"}		
							submenu["Recarregar"] = {reload, "<text01 style='width: 200px;'>Recarregar arma</text01>"}
						elseif value.index == "mochila" then
							submenu["Colocar"] = {bag, "<text01 style='width: 200px;'>Colocar mochila</text01>"}
						else
							submenu = {name=label.." ["..data.inventory[key].amount.."]"}
							submenu["Usar"] = {use, "<text01 style='width: 200px;'>Utilizar item</text01>"}
						end						
						submenu["Enviar"] = {send, "<text01 style='width: 200px;'>Enviar a um jogador proximo</text01>"}
						submenu["Dropar"] = {drop, "<text01 style='width: 200px;'>Jogar no chão</text01>"}
						submenu.onclose = function()
							vRP.closeMenu(player, submenu)
							buildInventory(player)
						end
						vRP.openMenu(player, submenu)
						break
					end
				end
			end
			
			local menu = {name="Inventário"}
			local count = 0
			for k,v in pairs(data.inventory) do count = count + 1
				if menu[k] then menu[k] = nil end	
				local weight = 0	
				local iweight = vRP.getItemWeight(k)
				weight = weight+iweight*data.inventory[k].amount
				menu[itemlist[k].nome] = { item, "<text01>Quantidade:</text01> <text02> "..data.inventory[k].amount.."</text02><text01>Peso:</text01> <text02>"..weight.."</text02><text01 style='color:gray;background:#000;width:174px;'><center>"..string.format("%.2f",vRP.getInventoryWeight(user_id)).."KG / "..string.format("%.2f",vRP.getInventoryMaxWeight(user_id)).."KG</center></text01>" }
			end
			menu.onclose = function()
				if close_count == 0 then
					if cb_close then
						cb_close()
					end
				end
			end
			if count <= 0 then
				TriggerClientEvent("Notify", source, "negado", "Seu <b>inventário</b> está vazio.")
				return
			end
			vRP.openMenu(source, menu)
		end
	end
end

function inventoryPlayer(id, source)
	local identity = vRP.getUserIdentity(id)
	local data = vRP.getUserDataTable(id)
	if data.inventory then
		local item = function(player, choice)
		end	
		local menu = {name="Inventário"}
		local count = 0
		for k,v in pairs(data.inventory) do count = count + 1
			if menu[k] then menu[k] = nil end	
			local weight = 0	
			local iweight = vRP.getItemWeight(k)
			weight = weight+iweight*data.inventory[k].amount
			menu[itemlist[k].nome] = { item, "<text01>Quantidade:</text01> <text02> "..data.inventory[k].amount.."</text02><text01>Peso:</text01> <text02>"..weight.."</text02><text01 style='color:white;background:#000;width:174px;'><center>Cidadão: "..identity.name.." "..identity.firstname.."</center></text01><text01 style='color:gray;background:#000;width:174px;'><center>"..string.format("%.2f",vRP.getInventoryWeight(id)).."KG / "..string.format("%.2f",vRP.getInventoryMaxWeight(id)).."KG</center></text01>" }
		end
		menu.onclose = function()
			vRP.closeMenu(source, menu)
		end
		if count <= 0 then
			TriggerClientEvent("Notify", source, "negado", "O <b>inventário</b> dele está vazio.")
			return
		end
		vRP.openMenu(source, menu)
	end
end

RegisterCommand('moc', function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if args[1] then
			local player = vRP.getUserSource(parseInt(args[1]))
			inventoryPlayer(parseInt(args[1]), source)			
		else
			buildInventory(source)
		end		
	end
end)

RegisterServerEvent("aztec:inventory")
AddEventHandler("aztec:inventory", function()
	buildInventory(source)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "paramedico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('me',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		TriggerClientEvent('chatME',-1,source,identity.name,rawCommand:sub(3))
		vRP.logs("savedata/me.txt","[ID]: "..user_id.." / [MENSAGEM]: "..rawCommand:sub(3))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARTAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('card',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local cd = math.random(1,13)
		local naipe = math.random(1,4)
		TriggerClientEvent('CartasMe',-1,source,identity.name,cd,naipe)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
local bandagem = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(bandagem) do
			if v > 0 then
				bandagem[k] = v - 1
			end
		end
	end
end)

RegisterCommand('use',function(source,args,rawCommand)
	if args[1] == nil then
		return
	end
	local user_id = vRP.getUserId(source)
	if args[1] == "bandagem" then
		vida = vRPclient.getHealth(source)
		if vida > 100 and vida < 400 then
			if bandagem[user_id] == 0 or not bandagem[user_id] then
				if vRP.tryGetInventoryItem(user_id,"bandagem",1) then
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent("progress",source,10000,"bandagem")
					SetTimeout(10000,function()
						bandagem[user_id] = 60
						TriggerClientEvent('bandagem',source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"sucesso","Bandagem utilizada com sucesso.")
					end)
				else
					TriggerClientEvent("Notify",source,"negado","Bandagem não encontrada na mochila.")
				end
			else
				TriggerClientEvent("Notify",source,"importante","Você precisa aguardar <b>"..bandagem[user_id].." segundos</b> para utilizar outra Bandagem.")
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.")
		end
	elseif args[1] == "mochila" then
		if vRP.tryGetInventoryItem(user_id,"mochila",1) then
			vRP.varyExp(user_id,"physical","strength",650)
			TriggerClientEvent("Notify",source,"sucesso","Mochila utilizada com sucesso.")
		else
			TriggerClientEvent("Notify",source,"negado","Mochila não encontrada na mochila.")
		end
	elseif args[1] == "cerveja" then
		if vRP.tryGetInventoryItem(user_id,"cerveja",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Cerveja utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Cerveja não encontrada na mochila.")
		end
	elseif args[1] == "tequila" then
		if vRP.tryGetInventoryItem(user_id,"tequila",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Tequila utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Tequila não encontrada na mochila.")
		end
	elseif args[1] == "vodka" then
		if vRP.tryGetInventoryItem(user_id,"vodka",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Vodka utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Vodka não encontrada na mochila.")
		end
			elseif args[1] == "agua" then
		if vRP.tryGetInventoryItem(user_id,"agua",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Água utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Água não encontrada na mochila.")
		end
	elseif args[1] == "whisky" then
		if vRP.tryGetInventoryItem(user_id,"whisky",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Whisky utilizado com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Whisky não encontrado na mochila.")
		end
	elseif args[1] == "conhaque" then
		if vRP.tryGetInventoryItem(user_id,"conhaque",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Conhaque utilizado com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Conhaque não encontrado na mochila.")
		end
	elseif args[1] == "absinto" then
		if vRP.tryGetInventoryItem(user_id,"absinto",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Absinto utilizado com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Absinto não encontrada na mochila.")
		end
	elseif args[1] == "maconha" then
		if vRP.tryGetInventoryItem(user_id,"maconha",1) then
			vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
			TriggerClientEvent("progress",source,10000,"fumando")
			SetTimeout(10000,function()
				vRPclient._stopAnim(source,false)
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent("Notify",source,"sucesso","Maconha utilizada com sucesso.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Maconha não encontrada na mochila.")
		end
	elseif args[1] == "rebite" then
		if vRP.tryGetInventoryItem(user_id,"rebite",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				vRPclient.playScreenEffect(source,"RaceTurbo",180)
				vRPclient.playScreenEffect(source,"DrugsTrevorClownsFight",180)
				TriggerClientEvent('energeticos',source,true)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Rebite utilizado com sucesso.")
			end)
			SetTimeout(60000,function()
				TriggerClientEvent('energeticos',source,false)
				TriggerClientEvent("Notify",source,"aviso","O efeito do rebite passou e o coração voltou a bater normalmente.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Rebite não encontrado na mochila.")
		end
	elseif args[1] == "capuz" then
		if vRP.getInventoryItemAmount(user_id,"capuz") >= 1 then
			local nplayer = vRPclient.getNearestPlayer(source,2)
			if nplayer then
				vRPclient.setCapuz(nplayer)
				vRP.closeMenu(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz utilizado com sucesso.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Capuz não encontrado na mochila.")
		end
	elseif args[1] == "energetico" then
		if vRP.tryGetInventoryItem(user_id,"energetico",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				TriggerClientEvent('energeticos',source,true)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Energético utilizado com sucesso.")
			end)
			SetTimeout(60000,function()
				TriggerClientEvent('energeticos',source,false)
				TriggerClientEvent("Notify",source,"aviso","O efeito do energético passou e o coração voltou a bater normalmente.")
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Energético não encontrado na mochila.")
		end
	elseif args[1] == "lockpick" then
		local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
		local mPlacaUser = vRP.getUserByRegistration(mPlaca)
		if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 and mName then
			if vRP.hasPermission(user_id,"policia.permissao") then
				TriggerClientEvent("syncLock",-1,mNet)
				return
			end

			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
			TriggerClientEvent("progress",source,30000,"roubando")
			SetTimeout(30000,function()
				TriggerClientEvent('cancelando',source,false)
				vRPclient._stopAnim(source,false)

				if not mPlacaUser then
					TriggerClientEvent("syncLock",-1,mNet)
					TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
				else
					if math.random(100) >= 80 then
						TriggerClientEvent("syncLock",-1,mNet)
						TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
					else
						TriggerClientEvent("Notify",source,"negado","Roubo do veículo falhou e as autoridades foram acionadas.")
						local policia = vRP.getUsersByPermission("policia.permissao")
						for k,v in pairs(policia) do
							local player = vRP.getUserSource(parseInt(v))
							if player then
								async(function()
									local id = idgens:gen()
									TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
									pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
									SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
								end)
							end
						end
					end
				end
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Precisa de uma <b>Lockpick</b> para iniciar o roubo do veículo.")
		end
	elseif args[1] == "masterpick" then
		local mPlaca,mName,mNet,mPrice,mBanido,mLock,mModel,mStreet = vRPclient.ModelName(source,7)
		local mPlacaUser = vRP.getUserByRegistration(mPlaca)
		if vRP.getInventoryItemAmount(user_id,"masterpick") >= 1 and mName then

			if vRP.hasPermission(user_id,"policia.permissao") then
				TriggerClientEvent("syncLock",-1,mNet)
				return
			end

			TriggerClientEvent('cancelando',source,true)
			vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
			TriggerClientEvent("progress",source,60000,"roubando")

			SetTimeout(60000,function()
				TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
				TriggerClientEvent('cancelando',source,false)
				TriggerClientEvent("syncLock",-1,mNet)
				vRPclient._stopAnim(source,false)

				local policia = vRP.getUsersByPermission("policia.permissao")
				for k,v in pairs(policia) do
					local player = vRP.getUserSource(parseInt(v))
					if player then
						async(function()
							local id = idgens:gen()
							TriggerClientEvent('chatMessage',player,"911",{65,130,255},"Roubo na ^1"..mStreet.."^0 do veículo ^1"..mModel.."^0 de placa ^1"..mPlaca.."^0 verifique o ocorrido.")
							pick[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
							SetTimeout(60000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
						end)
					end
				end
			end)
		else
			TriggerClientEvent("Notify",source,"negado","Precisa de uma <b>Masterpick</b> para iniciar o roubo do veículo.")
		end
	end
	TriggerEvent('logs:ToDiscord', discord_webhook5 , "USOU", "```Player "..user_id.." usou(por comando) o item: "..args[1].."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupas = {
	["minerador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 99,1 },
			[4] = { 89,20 },
			[5] = { -1,0 },
			[6] = { 82,2 },
			[7] = { -1,0 },
			[8] = { 90,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 273,0 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 114,1 },
			[4] = { 92,20 },
			[5] = { -1,0 },
			[6] = { 86,2 },
			[7] = { -1,0 },
			[8] = { 54,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 286,0 },
			["p1"] = { 25,0 }
		}
	},
    ["lixeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 17,0 },
			[4] = { 36,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 59,0 },
			[10] = { -1,0 },
			[11] = { 57,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 18,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 26,0 },
			[7] = { -1,0 },
			[8] = { 36,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 50,0 }
		}
	},
	["carteiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 17,10 },
			[5] = { 40,0 },
			[6] = { 7,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 242,3 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 14,1 },
			[5] = { 40,0 },
			[6] = { 10,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 250,3 }
		}
	},
	["fazendeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 37,0 },
			[4] = { 7,0 },
			[5] = { -1,0 },
			[6] = { 15,6 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 95,2 },
			["p0"] = { 105,23 },
			["p1"] = { 5,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 45,0 },
			[4] = { 25,10 },
			[5] = { -1,0 },
			[6] = { 21,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 171,4 },
			["p0"] = { 104,23 },
			["p1"] = { 11,2 }
		}
	},
	["lenhador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 62,0 },
			[4] = { 89,23 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p0"] = { 77,13 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 71,0 },
			[4] = { 92,23 },
			[5] = { -1,0 },
			[6] = { 69,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p1"] = { 25,0 }
		}
	},
	["taxista"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 11,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 10,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 13,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 112,0 },
			[5] = { -1,0 },
			[6] = { 6,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 27,0 }
		}
	},
	["caminhoneiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 63,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 81,0 },
			[10] = { -1,0 },
			[11] = { 173,3 },
			["p1"] = { 8,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 74,5 },
			[5] = { -1,0 },
			[6] = { 9,0 },
			[7] = { -1,0 },
			[8] = { 92,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 175,3 },
			["p1"] = { 11,0 }
		}
	},
	["motocross"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 111,0 },
			[4] = { 67,3 },
			[5] = { -1,0 },
			[6] = { 47,3 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 152,0 },
			["p1"] = { 25,5 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 128,0 },
			[4] = { 69,3 },
			[5] = { -1,0 },
			[6] = { 48,3 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 149,0 },
			["p1"] = { 27,5 }
		}
	},
	["mergulho"] = {
		[1885233650] = {
			[1] = { 122,0 },
			[3] = { 31,0 },
			[4] = { 94,0 },
			[5] = { -1,0 },
			[6] = { 67,0 },
			[7] = { -1,0 },
			[8] = { 123,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 243,0 },			
			["p0"] = { -1,0 },
			["p1"] = { 26,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 122,0 },
			[3] = { 18,0 },
			[4] = { 97,0 },
			[5] = { -1,0 },
			[6] = { 70,0 },
			[7] = { -1,0 },
			[8] = { 153,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 251,0 },
			["p0"] = { -1,0 },
			["p1"] = { 28,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pelado"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 34,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 35,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 82,0 }
		}
	},
	["paciente"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 61,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },			
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 104,0 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 57,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },		
			[8] = { 7,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 105,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["gesso"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 1,0 },
			[4] = { 84,9 },
			[5] = { -1,0 },
			[6] = { 13,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 186,9 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 3,0 },
			[4] = { 86,9 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },		
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 188,9 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["leiteiro"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 74,0 }, -- maos
			[4] = { 89,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 51,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 271,0 }, -- jaqueta		
			["p0"] = { 105,22 }, -- chapeu
			["p1"] = { 23,0 }, -- oculos
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 85,0 }, -- maos
			[4] = { 92,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 52,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 141,0 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 3,9 }, -- oculos
		}
	},
	["motorista"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 10,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 21,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 242,1 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 7,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 37,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 27,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 250,1 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["cacador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 97,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 2,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 100,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 44,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pescador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 98,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 85,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 247,12 }, -- jaqueta		
			["p0"] = { 104,20 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 101,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 88,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 255,13 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 11,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}
}


RegisterCommand('roupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		if args[1] then
			local custom = roupas[tostring(args[1])]
			if custom then
				local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
				vRPclient._setCustomization(source,idle_copy)
			end
		else
			vRP.removeCloak(source)
		end
		else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de roupa.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /PAYPAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('paypal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if args[1] == "sacar" and parseInt(args[2]) > 0 then
			local consulta = vRP.getUData(user_id,"vRP:paypal")
			local resultado = json.decode(consulta) or 0
			local fixbug = vRP.prompt(source,"Confirmaçao(Digite Sim):","")
			if fixbug == "sim" then
			if resultado >= parseInt(args[2]) then
				vRP.giveBankMoney(user_id,parseInt(args[2]))
				vRP.setUData(user_id,"vRP:paypal",json.encode(parseInt(resultado-args[2])))
				TriggerClientEvent("Notify",source,"sucesso","Efetuou o saque de <b>$"..vRP.format(parseInt(args[2])).." dólares</b> da sua conta paypal.")
			else
				TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente em sua conta paypal.")
				end
			end
		end
	end
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
	if args[1] == "trans" and parseInt(args[2]) > 0 and parseInt(args[3]) > 0 then
	local consulta = vRP.getUData(parseInt(args[2]),"vRP:paypal")
	local resultado = json.decode(consulta) or 0
	local banco = vRP.getBankMoney(user_id)
	local identityu = vRP.getUserIdentity(parseInt(args[2]))
	if vRP.request(source,"Deseja transferir <b>$"..vRP.format(parseInt(args[3])).."</b> dólares para <b>"..identityu.name.." "..identityu.firstname.."</b>?",30) then
		if banco >= parseInt(args[3]) then
			vRP.setBankMoney(user_id,parseInt(banco-args[3]))
			vRP.setUData(parseInt(args[2]),"vRP:paypal",json.encode(parseInt(resultado+args[3])))
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[3])).." dólares</b> ao passaporte <b>"..vRP.format(parseInt(args[2])).."</b>.")
			SendWebhookMessage(webhookpaypal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[3])).." \n[PARA O ID]: "..parseInt(args[2]).." "..identityu.name.." "..identityu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			local player = vRP.getUserSource(parseInt(args[2]))
			if player == nil then
				return
			else
				local identity = vRP.getUserIdentity(user_id)
				TriggerClientEvent("Notify",player,"importante","<b>"..identity.name.." "..identity.firstname.."</b> transferiu <b>$"..vRP.format(parseInt(args[3])).." dólares</b> para sua conta do paypal.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
				end
			end
		end
end
	end)