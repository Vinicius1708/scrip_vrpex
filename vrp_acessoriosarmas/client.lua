RegisterNetEvent('eden_accesories:silenciador')
AddEventHandler('eden_accesories:silenciador', function()
	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	
	if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		TriggerEvent("Notify","sucesso", "Você acabou de se equipar com um silenciador. Será necessário reequipá-lo a cada retorno na cidade.") 
	else 
		TriggerEvent("Notify","aviso", "Você não tem uma arma na mão ou sua arma não pode suportar um silenciador.")
	end
end)

RegisterNetEvent('eden_accesories:lanterna')
AddEventHandler('eden_accesories:lanterna', function()
	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)

	if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")	
	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.")
	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar suar arma com uma lanterna. Ele irá re-equipar todos os retornos para a cidade.") 
	else 
		TriggerEvent("Notify","aviso", "Você não tem uma arma na mão ou sua arma não suporta uma lanterna.")
	end
	end)

RegisterNetEvent('eden_accesories:grip')
AddEventHandler('eden_accesories:grip', function()
	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)

	if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com um gripp.")
	else 
		TriggerEvent("Notify","aviso","Sua arma atual não pode receber gripp.")	
	end
end)

RegisterNetEvent('eden_accesories:skin')
AddEventHandler('eden_accesories:skin', function()
	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)

	if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.")
	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.")
	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.")
	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.")
	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.") 
	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.")
	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.")
	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
		TriggerEvent("Notify","sucesso", "Você acabou de equipar sua arma com uma skin.") 
	else 
		TriggerEvent("Notify","aviso","Sua arma atual não pode receber skin.")			
	end
end)











