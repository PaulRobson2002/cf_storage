resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_script "config.lua"

client_scripts {
    "@cf/locale.lua",
    "client.lua"
}

server_scripts{ 
    "server.lua",
    "@mysql-async/lib/MySQL.lua"
}

