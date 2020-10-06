local minute = 20

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000) 
		minute = minute - 1
		if minute == 0  then
			minute = 20
			TriggerServerEvent('offred:salar')
		end
	end
end)