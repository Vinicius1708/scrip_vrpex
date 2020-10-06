fx_version 'bodacious'
game 'gta5'

author 'Esquilo - Rox Infinity'
description 'Rox Identidade. Interface adaptada por Esquilo. Créditos ao Jove Angelevski (https://codepen.io/AlbertFeynman)'
version '1.0.0'

ui_page_preload 'yes'
ui_page 'nui/ui.html'

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

files {
	'nui/**/*'
}