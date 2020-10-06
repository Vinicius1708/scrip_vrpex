Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
htmlEntities = module("vrp", "lib/htmlEntities")

vRPdmv = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
DMVclient = Tunnel.getInterface("vrp_dmvschool")
Tunnel.bindInterface("vrp_dmvschool",vRPdmv)
Proxy.addInterface("vrp_dmvschool",vRPdmv)
cfg = module("vrp_dmvschool", "cfg/dmv")
-- load global and local languages
--Luang = module("vrp", "lib/Luang")
--Lang = Luang()
--Lang:loadLocale(cfg.lang, module("vrp", "cfg/lang/"..cfg.lang) or {})
--Lang:loadLocale(cfg.lang, module("vrp_dmvschool", "cfg/lang/"..cfg.lang) or {})
--lang = Lang.lang[cfg.lang]

function vRPdmv.setLicense()
	local user_id = vRP.getUserId(source)
	vRP.setUData(user_id,"vRP:dmv:license",json.encode(os.date("%x")))
end

function vRPdmv.payTheory()
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	if vRP.tryPayment(user_id,250) then
        DMVclient.startTheory(player)
	else
		TriggerClientEvent("pNotify:SendNotification", player, {
      text = "Dinheiro Insuficiente",
      type = "error",progressBar = false,timeout = 3000,layout = "nycolaaz",queue = "left",
      animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
    })
	end
end

function vRPdmv.payPractical()
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	if vRP.tryPayment(user_id,500) then
        DMVclient.startPractical(player)
	else
		TriggerClientEvent("pNotify:SendNotification", player, {
      text = "Dinheiro Insuficiente",
      type = "error",progressBar = false,timeout = 3000,layout = "nycolaaz",queue = "left",
      animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
    })
	end
end

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local data = vRP.getUData(user_id,"vRP:dmv:license")
	if data then
	  local license = json.decode(data)
	  if license and license ~= 0 then
        DMVclient.setLicense(player, true)
	  end
	end
end)

--[[RegisterCommand("cnh",function(source)
  local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
  local user_id = vRP.getUserId(source)
  if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"cnh.permissao") then
    if nuser_id then
      TriggerClientEvent("pNotify:SendNotification", source, {
        text = "Pedido enviado",
        type = "info",progressBar = false,timeout = 3000,layout = "nycolaaz",queue = "left",
        animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
      })
      --if vRP.request(nplayer,"Deseja mostrar sua CNH ?",15) then
      local data = vRP.getUData(nuser_id,"vRP:dmv:license")
        if data then
        local license = json.decode(data)
      if license and license ~= 0 then
            --local identity = vRP.getUserIdentity(nuser_id)
            --if identity then
              -- display identity and business
              --local name = identity.name
              --local firstname = identity.firstname
              --local age = identity.age
              --local phone = identity.phone
              --local registration = identity.registration

              TriggerClientEvent("Notify","sucesso","Possui CNH")
            
              --local content = lang.dmv.police.license({name,firstname,age,registration,phone,license})
              --vRPclient.setDiv(source,"police_identity",".div_police_identity{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content)
              -- request to hide div
              --vRP.request(source, "Devolver CNH", 1000)
              --vRPclient.removeDiv(source,"police_identity")
            --end
        else
          TriggerClientEvent("Notify",source,"negado","Não possui CNH.")
          end
      else
        TriggerClientEvent("Notify",source,"negado","Não possui CNH.")
        end
      --else
        --TriggerClientEvent("Notify",source,"negado","Recusou a mostrar a CNH.")
      --end
    else
      TriggerClientEvent("Notify",source,"negado","Nenhum jogador perto.")
    end
  else
    TriggerClientEvent("Notify",source,"negado","Você não é um polícial.")
  end    
end)

RegisterCommand("rcnh",function(source)
  local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
  local user_id = vRP.getUserId(source)
  if vRP.hasPermission(user_id,"policia.permissao") then
    if nuser_id then
      if vRP.request(source,"Tem certeza que deseja remover esta licença?",15) then
      local data = vRP.getUData(nuser_id,"vRP:dmv:license")
        if data then
        local license = json.decode(data)
      if license and license ~= 0 then
            DMVclient.setLicense(nplayer, false)
          vRP.setUData(nuser_id,"vRP:dmv:license",json.encode())
          TriggerClientEvent("Notify",source,"negado","Sua CNH foi retirada.")
          TriggerClientEvent("Notify",source,"sucesso","CNH removida com sucesso.")
        else
          TriggerClientEvent("Notify",source,"negado","Não possui CNH.")
          end
      else
        TriggerClientEvent("Notify",source,"negado","Não possui CNH.")
        end
      else
        TriggerClientEvent("Notify",source,"negado","Recusou mostrar a CNH.")
      end
    else
      TriggerClientEvent("Notify",source,"negado","Nenhum jogador perto.")
    end
  else
   TriggerClientEvent("Notify",source,"negado","Você não é um polícial.")  
  end 
end)]]

--[[Citizen.CreateThread(function()
  while true do
    Citizen.Wait(2000)

    local nplayer = vRPclient.getNearestPlayer(source,2)
	  local nuser_id = vRP.getUserId(nplayer)

    local user_id = vRP.getUserId(1)
    local data = vRP.getUData(user_id,"vRP:dmv:license")
    local license = json.decode(data)
    print(license)

  end
end)]]

RegisterCommand("cnh",function(source,args)
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"policia.permissao") then

      local nuser_id = args[1]  

      local data = vRP.getUData(nuser_id,"vRP:dmv:license")
      local license = json.decode(data)

      if nuser_id == nil then
        nuser_id = 0
      end  

      print(license)

      if license == nil then
        TriggerClientEvent("Notify",source,"negado","Passaporte "..parseInt(args[1]).." não possui CNH")
      end 
      
      if license ~= nil and license ~= "" and license ~= 0 and license ~= "null" then
        TriggerClientEvent("Notify",source,"sucesso","Passaporte "..parseInt(args[1]).." possui CNH")
      end
    else
      TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
    end  
end)

RegisterCommand("rcnh",function(source,args)
  local user_id = vRP.getUserId(source)

  if vRP.hasPermission(user_id,"policia.permissao") then

    local nuser_id = args[1]  

    vRP.setUData(nuser_id,"vRP:dmv:license",json.encode())

    TriggerClientEvent("Notify",source,"sucesso","CNH removida do passaporte: "..parseInt(args[1]).."")
  else    
    TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
  end  
end)