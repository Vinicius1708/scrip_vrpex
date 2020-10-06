local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPNserver = Tunnel.getInterface("vrp_changename")

RegisterCommand("identidade",function(source,args)
	if checkDistance() then	
		TriggerServerEvent("hoppe:changename",args[1],args[2],args[3])
	else
		TriggerEvent("Notify","negado","Vá até a prefeitura para mudar seu nome")
	end	
	--print(true)
end)

function checkDistance()
	local ped = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(x,y,z)
	local distance = GetDistanceBetweenCoords(x,y,cdz,-551.03857421875,-192.28303527832,38.223083496094,true)
	if distance < 10 then
		return true
	else
		return false
	end		
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if checkDistance() then
			DrawMarker(23,-551.03857421875,-192.28303527832,38.223083496094-0.99,1,1,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,1,0,0)
			DrawText3D(-551.03857421875,-192.28303527832,38.223083496094, "Mudar Nome", 2.0, 7, 100)
			DrawText3D(-551.03857421875,-192.28303527832,38.223083496094-0.4, "/identidade [nome] [sobrenome] [idade]", 2.0, 1, 100)
		end	 
	end
end)

function DrawText3D(x,y,z, text, scl, font, opacity) 
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
	local scale = (1/dist)*scl
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
   
	if onScreen then
		SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, opacity)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
	end
end