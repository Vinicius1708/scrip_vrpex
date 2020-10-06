resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

name 'SAWU Hookers'
description 'This is the most ridiculous and useless thing i have ever made'
owner 'saNhje / stianhje on fivem forums'

server_scripts {
	"@vrp/lib/utils.lua",
	'server/main.lua',
	'config.lua'
}

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"@vrp/lib/utils.lua",
	'client/main.lua',
	'config.lua'
}

ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/libraries/axios.min.js',
	'ui/libraries/vue.min.js',
	'ui/libraries/vuetify.css',
	'ui/libraries/vuetify.js',
	'ui/script.js',
	'ui/style.css',
	-- images
	'ui/img/Vennesa.png',
	'ui/img/Cathrine.png',
	'ui/img/Tatiana.png',
	'ui/img/Bootylicious.png',
	'ui/img/blowjob.png',
	'ui/img/sex.png',
}
