-- R A S T R E A R --
RegisterNetEvent('rastrear')
AddEventHandler('rastrear',function() 
	local player = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(player)) then 
		saveVehicle = GetVehiclePedIsIn(player,true)
		local vehicle = saveVehicle
		targetBlip = AddBlipForEntity(vehicle)
		SetBlipSprite(targetBlip,225)
		if not i then i = 0 end
		SetBlipColour(targetBlip,i)
		i=i+1
		ShowNotification("~g~Instalando rastreador.")
	else ShowNotification("~r~Você deve instalar um rastreador em um veículo.") end
end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end
