print( '^1[JuaN] ^7ESX Admin Menu ^2enabled^7' )

local ESX = nil

Citizen.CreateThread( function()
	TriggerEvent( 'esx:getSharedObject', function( obj ) ESX = obj end )
end )

RegisterNetEvent( '__esx:admin_menu:pcheck' )
AddEventHandler( '__esx:admin_menu:pcheck', function()
	TriggerClientEvent( '__esx:admin_menu:pcheck__client', source, ESX.GetPlayerFromId( source ).getGroup() )
end )