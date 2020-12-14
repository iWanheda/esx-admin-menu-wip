fx_version 'bodacious'
game 'gta5'

name 'ESX Admin Menu'
author 'ShahZaM </>'
version '1.0'

client_scripts {
	'@menuv/menuv.lua',
	
	'menu/*.lua',
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

shared_script 'config.lua'

dependency 'menuv'