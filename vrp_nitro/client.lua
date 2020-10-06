local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_nitro")

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local carro = GetVehiclePedIsUsing(ped)
        force = 70.0

        local vel = GetEntitySpeed(carro)

        nitro = table.unpack(func.getNitroAmount())

        if IsControlJustPressed(0,252) and IsPedInAnyVehicle(ped, true) then
            if func.getNitro() then
                SetVehicleBoostActive(carro, 1, 0)
                SetVehicleForwardSpeed(carro, force)
                StartScreenEffect("RaceTurbo", 0, 0)
                SetVehicleCurrentRpm(carro,1.0)
                SetVehicleClutch(carro,4)
                SetVehicleTurboPressure(carro,true)
                Citizen.Wait(2500)                      ---- aumentar o tempo que nitro ira durar
                SetVehicleBoostActive(carro, 0, 0)
            else
                TriggerEvent("Notify", "negado","Você não possui mais nitro")    
            end
        end    
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        if IsPedInAnyVehicle(ped, true) then
            drawTxt(0.805,0.825,0.42,"NITRO:",200,200,200,255)
            drawTxt(0.830,0.825,0.42,nitro,255,0,0,255)
            if nitro == 0 then
                drawTxt(0.830,0.825,0.42,"0",200,200,200,255)
            end    
        end
    end
end)

function drawTxt(x,y,scale,text,r,g,b,a)
	SetTextFont(4)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end