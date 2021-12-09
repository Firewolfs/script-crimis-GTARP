fx_version 'adamant'
game 'gta5'

client_scripts {
    "libs/rage_ui/RageUI.lua",
    "libs/rage_ui/Menu.lua",
    "libs/rage_ui/MenuController.lua",
    "libs/rage_ui/components/*.lua",
    "libs/rage_ui/elements/*.lua",
    "libs/rage_ui/items/*.lua",
    "libs/rage_ui/panels/*.lua",
    "libs/rage_ui/windows/*.lua",
    'menus/menu_cartel.lua',
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}