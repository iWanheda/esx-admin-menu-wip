Config = { }

-- So we can use ESX in our config thing :D
local ESX = nil

Citizen.CreateThread( function()
	TriggerEvent( 'esx:getSharedObject', function( obj ) ESX = obj end )
end )

Config.menuOptions = {
	title = 'Admin Menu',
	subTitle = 'Released for FREE',
	key = 'F1'
	
	-- Coming Soon: Color, etc...
}

Config.Hierarchy = {
	'admin',
	'moderator',
	'helper'
}

Config.menuList = {
	{
		title = 'Player Options',
		group = 'admin', -- This is all still W.I.P

		subMenu = {
			{
				title = 'Heal Self',
				group = 'admin',

				fn = function()
					print( 'Healed!' )
				end,

				log = true
			},
			{
				title = 'Force Community Service',
				group = 'admin',

				fn = function()
					print( 'Healed!' )
				end,

				log = true
			},
			{
				title = 'End Community Service',
				group = 'admin',

				fn = function()
					print( 'Healed!' )
				end,

				log = true
			},
			{
				title = 'Give Item',
				group = 'admin',

				fn = function()
					print( 'Gave an item!' )
				end,

				log = true
			},
			{
				title = 'Clear Inventory',
				group = 'admin',

				fn = function()
					print( 'Healed!' )
				end,

				log = false
			},
			{
				title = 'Clear Loadout',
				group = 'admin',

				fn = function()
					print( 'Healed!' )
				end,

				log = false
			},
			{
				title = 'Set Job',
				group = 'admin',

				fn = function()
					print( 'Healed!' )
				end,

				log = true
			}
		}
	},
	{
		title = 'Vehicle Options',
		group = 'moderator',

		subMenu = {
			{
				title = 'Fix Vehicle',
				group = 'moderator',

				fn = function()
					local ped = GetPlayerPed( -1 )
				
					if IsPedInAnyVehicle( ped, false ) then
						local vehicle = GetVehiclePedIsIn( ped, false )
					
						SetVehicleEngineHealth( vehicle, 1000 )
						SetVehicleEngineOn( vehicle, true, true )
						SetVehicleFixed( vehicle )
						
						ESX.ShowNotification( 'Vehicle Fixed!', false, false, false )
					else
						ESX.ShowNotification( 'You need to be inside a vehicle to fix it!', false, false, false )
					end
				end,

				log = true
			},
			{
				title = 'Get to Driver\'s seat',
				group = 'admin', -- So this submenu can be opened by moderators, although this option won't pop up for them, unless they're admins

				fn = function()
					print( 'Healed!' )
				end,

				log = false
			},
			{
				title = 'Delete Vehicle',
				group = 'moderator',

				fn = function()
					print( 'Healed!' )
				end,

				log = true
			}
		}
	},
}