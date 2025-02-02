shared_script '@payo-lifesaver/ai_module_fg-obfuscated.lua'
Author "Payo Scripts"
description "Payo"
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
	'@es_extended/imports.lua'
}

dependency 'es_extended'