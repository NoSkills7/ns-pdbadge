fx_version 'cerulean'
game 'gta5'

description 'Simple Police Badge System'

shared_script 'config.lua'

client_scripts {
	'@ox_lib/init.lua', -- Remove if not using ox_lib
	'client.lua',
}

server_scripts {
	'server.lua',
}

lua54 'yes'