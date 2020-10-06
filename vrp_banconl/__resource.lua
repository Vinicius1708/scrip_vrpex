resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependencies {
	'vrp',
	'vrp_ghmattimysql'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/ui.css',
	'html/ui.js',
}

client_script {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts{ 
	"@vrp/lib/utils.lua",
	"server.lua"
}
