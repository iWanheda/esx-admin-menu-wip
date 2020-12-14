local ESX, mainMenu = nil, MenuV:CreateMenu( Config.menuOptions.title, Config.menuOptions.subTitle, 'topleft', 0, 0, 255, nil, nil, nil, nil, 'native' )
MenuV:CloseMenu( mainMenu )

local menuTable = { }

Citizen.CreateThread( function()
	TriggerEvent( 'esx:getSharedObject', function( obj ) ESX = obj end )
	TriggerServerEvent( '__esx:admin_menu:pcheck' ) -- Default value since script start! :D

	while playerGroup == nil do
		Citizen.Wait( 500 )
	end

	for k, v in pairs(Config.menuList) do
		local subMenu = mainMenu:InheritMenu( { title = v.title } )

		mainMenu:AddButton( { label = v.title, value = { menu = subMenu.UUID, group = v.group }, select = function( item )
			print( '-> User is ' .. playerGroup )
			if ( playerGroup ~= tostring( Config.Hierarchy[1] ) and v.group and playerGroup == v.group ) then
				MenuV:OpenMenu( item.Value.menu )
			elseif ( playerGroup == tostring( Config.Hierarchy[1] ) ) then
				MenuV:OpenMenu( item.Value.menu )
			end
		end } )
	
		for _k, _v in pairs( v.subMenu ) do
			if ( playerGroup ~= nil and playerGroup ~= tostring( Config.Hierarchy[1] ) and _v.group == playerGroup ) then
				print( 'User is ' .. playerGroup )
				subMenu:AddButton( { label = _v.title, value = _v, select = function( item )
					if ( item.Value and item.Value.log ) then
						--TriggerServerEvent( '__esx:admin_menu:log', tostring( _v.title ) )
					end
	
					item.Value.fn( item )
				end } )
			elseif ( playerGroup == tostring( Config.Hierarchy[1] ) ) then
				subMenu:AddButton( { label = _v.title, value = _v, select = function( item )
					if ( item.Value and item.Value.log ) then
						--TriggerServerEvent( '__esx:admin_menu:log', tostring( _v.title ) )
					end

					item.Value.fn( item )
				end } )
			end
		end
	end

	-- DEBUG
	while true do
		Citizen.Wait( 1 )

		if IsControlJustReleased( 0, 51 ) then
			TriggerServerEvent( '__esx:admin_menu:pcheck' )
			mainMenu:Open()
			print(playerGroup)
		end
	end
end )

--mainMenu:OpenWith( 'keyboard', Config.menuOptions.key )

playerGroup = nil

RegisterNetEvent( '__esx:admin_menu:pcheck__client' )
AddEventHandler( '__esx:admin_menu:pcheck__client', function( data )
	if playerGroup ~= data then -- To prevent removing groups and still be able to open the menu and such
		playerGroup = data
	end
end )