local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

ykP = Tunnel.getInterface("vrp_emservico")
local onservicePOLICE = false
local onserviceEMS = false
local onserviceTAXI = false
local onserviceMEC = false
local onserviceConce = false

local emservicoPolicia = {
    {443.71032714844,-975.10162353516,30.68966293335},  -- PC
    {474.47235107422,-1090.6632080078,38.706512451172},  -- PF
    {828.17175292969,162.91110229492,86.386711120605},  -- BOPE
    {-2049.8937988281,-463.48132324219,12.240763664246},  -- PMERJ
    {-3021.587890625,396.61474609375,16.685821533203},  -- PRF
    {2921.0014648438,4171.07421875,52.502647399902}, -- PRF
    {2638.5485839844,275.91473388672,100.23503875732}, -- PRF
    {1511.0297851562,781.6865234375,78.429862976074} -- PRF
}
local emservicoEMS = {
    {310.42477416992,-597.59979248047,43.291801452637},
}
local emservicoTaxi = {
    {894.29254150391,-173.13482666016,81.594970703125}
}

local emservicoConce = {
    {-41.597034454346,-1089.1422119141,26.423305511475}
}
local emservicoMecanico = {
{953.33068847656,-967.31573486328,39.760131835938}

}

local contador = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        for k,v in ipairs(emservicoPolicia) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
				if onservicePOLICE and contador == 0 and distance <= 1.5 then
					DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,246)) then
                        local ped = PlayerPedId()
                        ykP.offService(source)
                        SetPedArmour(ped, 0)
                        RemoveAllPedWeapons(ped,true)
                        SetPedComponentVariation(ped, 9, 0, 0, 0)
                        onservicePOLICE = false
                        contador = 2
                    end
                elseif not onservicePOLICE and contador == 0 and distance <= 1.5 then
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onservicePOLICE = true
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoEMS) do
            local x,y,z = table.unpack(v)
            local ped = PlayerPedId()
            local pCoords = GetEntityCoords(ped)
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
				if onserviceEMS and contador == 0 and distance <= 1.5 then
					DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,246)) then
                        ykP.offService(source)
                        SetPedArmour(ped, 0)
                        RemoveAllPedWeapons(ped,true)
                        SetPedComponentVariation(ped, 9, 0, 0, 0)
                        TriggerEvent('emp_paramedico:encerrarJob')
                        onserviceEMS = false
                        contador = 2
                    end
                elseif not onserviceEMS and contador == 0 and distance <= 1.5 then
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1, 49)) and ykP.emServico() then
                        TriggerEvent('emp_paramedico:iniciarJob')
                        TriggerEvent('paycheck:iniciarContador')
                        onserviceEMS = true
                        contador = 2
                    end
                end
            end
        end


        for k,v in ipairs(emservicoTaxi) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
				if onserviceTAXI and contador == 0 and distance <= 1.5 then
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceTAXI = false
                        contador = 2
                    end
                elseif not onserviceTAXI and contador == 0 and distance <= 1.5 then
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceTAXI = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoConce) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
				if onserviceConce and contador == 0 and distance <= 1.5 then
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceConce = false
                        contador = 2
                    end
                elseif not onserviceConce and contador == 0 and distance <= 1.5 then
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceConce = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoMecanico) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
				if onserviceMEC and contador == 0 and distance <= 1.5 then
                DrawText3d(x, y, z+0.5, "~r~[ Y ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
					if IsControlJustPressed(1,246) then
                        ykP.offService(source)
                        onserviceMEC = false
                        contador = 2
                    end
                elseif not onserviceMEC and contador == 0 and distance <= 1.5 then
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceMEC = true
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

    end
end)


RegisterNetEvent('vrp_emservico:receberColete')
AddEventHandler('vrp_emservico:receberColete', function()
    local ped = PlayerPedId()
    SetPedArmour(ped, 100)
end)

------------ CONTADOR
Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if contador > 0 then
            contador = contador - 2
        end
    end
end)
------------

function DrawText3d(x,y,z, text, alpha)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.5, 0.5)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, alpha)
        SetTextDropshadow(0, 0, 0, 0, alpha)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
end