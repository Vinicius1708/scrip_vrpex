RegisterNetEvent("progress")
AddEventHandler("progress",function(time,text)
	SendNUIMessage({ display = true, time = time, text = text })
end)