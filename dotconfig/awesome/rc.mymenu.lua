-- MT: awesome menu file. Used in main rc.lua

local beautiful = require("beautiful")
local awful = require("awful")
local debian = require("debian.menu")

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }

mymainmenu = awful.menu({
        items = {
	   {"Lock", "./bin/awesome/lock_workspace"},
	   {"Leave", "./bin/awesome/leave"},
	   {"Saver", "xscreensaver"},
	   { "-----------------", false},
	   {"Pavucontrol", "pavucontrol"},
	   { "-----------------", false},
	   {"Code", "code"},
	   {"Emacs", "emacs"},
	   {"Nautilus", "nautilus"},
	   { "vifm", terminal .. " -e vifm"},
	   { "-----------------", false},
	   {"Connect_dev", "./bin/connect_dev"},
	   {"Connect_stage", "./bin/connect_stage"},
	   {"Connect_prod", "./bin/connect_prod"},
	   { "-----------------", false},
	   {"Screenshot", "./bin/awesome/screenshot"},
	   {"Gimp", "gimp"},
	   {"Flameshot gui", "flameshot gui"},
	   { "-----------------", false},
	   {"Firefox", "firefox"},
	   {"Chrome", "google-chrome"},
	   { "-----------------", false},
	   {"Keepassxc", "keepassxc"},
	   {"Dbeaver", "dbeaver"},
	   { "-----------------", false},
	   {"Thunderbird", "thunderbird"},
	   {"Telegram", "telegram-desktop"},
	   {"Teams-For-Linux", "teams-for-linux"},
	   {"Slack", "slack"},
	   { "-----------------", false},
	   {"1 Display", "./bin/awesome/display notebook"},
	   {"2 Displays", "./bin/awesome/display both"},
	   { "-----------------", false},
           { "Debian", debian.menu.Debian_menu.Debian },
           menu_awesome,
           menu_terminal,
        }
})

