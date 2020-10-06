------------------------------------------------------
----------https://github.com/DaviReisVieira-----------
------------EMAIL:VIEIRA08DAVI38@GMAIL.COM------------
---------------DISCORD: DAVI REIS #2602---------------
------------------------------------------------------

-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- vRP
vRP._prepare("vRP/create_colunas", [[
ALTER TABLE vrp_users ADD IF NOT EXISTS pet varchar(50) DEFAULT NULL;
]])
vRP._prepare("vRP/ver_id","SELECT * FROM vrp_users WHERE id = @id")
vRP._prepare("vRP/update_pet","UPDATE vrp_users SET pet = NULL WHERE id = @id")
vRP._prepare("vRP/comprar_pet","UPDATE vrp_users SET pet = @pet WHERE id = @id")

vRP._execute("vRP/create_colunas")

local pets = {
	["chien"] = {
		name = "Cão",
		funcao = "chien",
		price = 50000
	},
	["chat"] = {
		name = "Gato",
		funcao = "chat",
		price = 15000
	},
	["loup"] = {
		name = "Lobo",
		funcao = "loup",
		price = 30000
	},
	["lapin"] = {
		name = "Coelho",
		funcao = "lapin",
		price = 25000
	},
	["husky"] = {
		name = "Husky",
		funcao = "husky",
		price = 35000
	},
	["cochon"] = {
		name = "Porco",
		funcao = "cochon",
		price = 10000
	},
	["caniche"] = {
		name = "Poodle",
		funcao = "caniche",
		price = 50000
	},
	["carlin"] = {
		name = "Pug",
		funcao = "carlin",
		price = 20000
	},
	["retriever"] = {
		name = "Retriever",
		funcao = "retriever",
		price = 23000
	},
	["berger"] = {
		name = "Cão Alsatian",
		funcao = "berger",
		price = 55000
	},
	["westie"] = {
		name = "Westie",
		funcao = "westie",
		price = 50000
	}
}

RegisterServerEvent("vrp_pets:morreu")
AddEventHandler("vrp_pets:morreu", function()
	local _source = source
	local player = vRP.getUserId(_source)
	vRP.execute("vRP/update_pet", {id = player})
end)

RegisterServerEvent('vrp_pets:alimentarbixin')
AddEventHandler('vrp_pets:alimentarbixin', function()
	local _source = source
	local player = vRP.getUserId(_source)
	vRP.tryGetInventoryItem(player, 'croquettes', 1)
end)


RegisterServerEvent("vrp_pets:abrimenucompra")
AddEventHandler("vrp_pets:abrimenucompra", function()
	local _source = source
	local player = vRP.getUserId(_source)
	local menudata = {}
	
	menudata.name = "Loja de Animais"
	menudata.css = {align = 'top-left', header_color = "rgba(6, 177, 253,0.75)"}

	for k, v in pairs(pets) do
		menudata[v.name] = {function (choice)
			local playerMoney = vRP.getMoney(_source)
			local Certeza = vRP.request(_source, "Tem certeza que deseja <b>comprar</b> por R$" .. v.price .. ",00?", 30)
			if Certeza then
			if vRP.tryPayment(player, v.price) then
				vRP.execute("vRP/comprar_pet", {pet = pets[k].funcao, id = player})
				--vRPclient.notifyPicture(_source, "CHAR_CHOP", 9, "Pet-Shop ProjetoRJ", false, "Você comprou um ~b~" .. pets[k].name .. "!~r~   Valor:~g~ R$ " .. v.price)
				TriggerClientEvent("Notify", _source, "sucesso", "Você comprou um " .. pets[k].name .. "! Valor:R$ " .. v.price)
			else 
				--vRPclient.notifyPicture(_source, "CHAR_CHOP", 9, "Pet-Shop ProjetoRJ", false,  "~r~Dinheiro Insuficiente!")
				TriggerClientEvent("Notify", _source, "sucesso", "Dinheiro Insuficiente!")
			end
		else
			TriggerClientEvent("Notify", _source, "negado", "Compra cancelada.")
			end
			vRP.closeMenu(_source)
		end, "<text01>Valor:</text01><text02>R$"..v.price.."</text02>"}
	end
	
	vRP.openMenu(_source, menudata)
end)


RegisterServerEvent("vrp_pets:MenudoPet")
AddEventHandler("vrp_pets:MenudoPet", function (status, come, isInVehicle)
	local _source = source
	local player = vRP.getUserId(_source)
	local menudata = {}

	menudata.name = "Menu do Pet"
	menudata.css = {align = 'top-left', header_color = "rgba(255,215,0,0.75)"}

	if come == 1 then
		if status > 100 then
		 status = 100
		end
		
		menudata["Alimentar"] = {function (choice)
			local data = vRP.getUserDataTable(player)
			TriggerClientEvent("vrp_pets:DarComidaa", _source, data.inventory)
			vRP.closeMenu(_source)  
		--end, vRPclient._notify(_source,"Alimentação: " .. status .. "%")}
		end, TriggerClientEvent("Notify", _source, "aviso", "Alimentação: " .. status .. "%")}
		
		menudata["Juntar/Separar do Pet"] = {function (choice)
			TriggerClientEvent("vrp_pets:JuntarouSeparar", _source)
			vRP.closeMenu(_source)
		end}

		if isInVehicle then
			menudata["Retirar do Carro"] = {function (choice)
				TriggerClientEvent("vrp_pets:SairouEntracarrin", _source)
				vRP.closeMenu(_source)
			end}
		else
			menudata["Entrar no Carro"] = {function (choice)
				TriggerClientEvent("vrp_pets:SairouEntracarrin", _source)
				vRP.closeMenu(_source)
			end}
		end

		menudata["Dar uma Ordem"] = {function (choice)
			local rows = vRP.query("vRP/ver_id", {id = player})
				if #rows > 0 then
					TriggerClientEvent("vrp_pets:ordenspets", _source, rows[1].pet)
				end
			vRP.closeMenu(_source)
		end}
	else
		menudata["Chamar o seu Pet"] = {function (choice)
			if come == 0 then
						local rows = vRP.query("vRP/ver_id", {id = player})
						if #rows > 0 then
							TriggerClientEvent("vrp_pets:chamarPetzin", _source, rows[1].pet)
						end
				vRP.closeMenu(_source)
			end
		end}
	end

	vRP.openMenu(_source, menudata)
end)

RegisterServerEvent("vrp_pets:MenudeOrdens")
AddEventHandler("vrp_pets:MenudeOrdens", function (data, model, inanimation)
	local _source = source
	local player = vRP.getUserId(_source)
	local menudata = {}

	menudata.name = "Ordens do Pet"
	menudata.css = {align = 'top-left', header_color = "rgba(255,215,0,0.75)"}
	
	if not inanimation then
		if model ~= 1462895032 then
			menudata["Procurar a bola"] = {function (choice) -- balle
				TriggerClientEvent("vrp_pets:AcharBolinha", _source)
				vRP.closeMenu(_source)
			end}
		end
		menudata["Seguir-me"] = {function (choice) -- pied
			TriggerClientEvent("vrp_pets:Seguirme", _source)
			vRP.closeMenu(_source)
		end}
		menudata["Ir para a Casinha"] = {function (choice) -- niche
			TriggerClientEvent("vrp_pets:IrpCasa", _source)
			vRP.closeMenu(_source)
		end}
		
		if (data == "chien") then
			menudata["Sentar"] = {function (choice) -- assis
				TriggerClientEvent("vrp_pets:Sentar", _source, 1)
				vRP.closeMenu(_source)
			end}
			menudata["Deitar"] = {function (choice) -- coucher
				TriggerClientEvent("vrp_pets:Deitar", _source, 1)
				vRP.closeMenu(_source)
			end}
		end
		if (data == "chat") then
			menudata["Deitar"] = {function (choice) -- coucher2
				TriggerClientEvent("vrp_pets:Deitar", _source, 2)
				vRP.closeMenu(_source)
			end}
		end
		if (data == "loup") then
			menudata["Deitar"] = {function (choice) -- coucher3
				TriggerClientEvent("vrp_pets:Deitar", _source, 3)
				vRP.closeMenu(_source)
			end}
		end
		if (data == "carlin") then
			menudata["Sentar"] = {function (choice) -- assis2
				TriggerClientEvent("vrp_pets:Sentar", _source, 2)
				vRP.closeMenu(_source)
			end}
		end
		if (data == "retriever") then
			menudata["Sentar"] = {function (choice) -- assis3
				TriggerClientEvent("vrp_pets:Sentar", _source, 3)
				vRP.closeMenu(_source)
			end}
		end
	else
		menudata["Levantar"] = {function (choice) -- debout
			TriggerClientEvent("vrp_pets:levantar", _source)
			vRP.closeMenu(_source)
		end}
	end

	vRP.openMenu(_source, menudata)
end)