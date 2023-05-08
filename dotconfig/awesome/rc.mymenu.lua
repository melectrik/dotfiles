-- MT: awesome menu file. Used in main rc.lua

local beautiful = require("beautiful")
local awful = require("awful")
local debian = require("debian.menu")

local menu_awesome = { "awesome", my_awesome_menu, beautiful.awesome_icon }
local menu_apps = { "apps", my_apps_menu, beautiful.awesome_icon }
local menu_terminal = { "terminals", my_term_menu, beautiful.awesome_icon }

mymainmenu = awful.menu({
        items = {
	   {"Screenshot", "./dotfiles/bin/awesome/screenshot"},
	   {"Lock", "./dotfiles/bin/awesome/lock_workspace"},
	   {"Leave", "./dotfiles/bin/awesome/leave"},
	   {"Saver", "xscreensaver"},
	   {"Suspend", "./dotfiles/bin/awesome/suspend"},
	   { "-----------------", false},
	   {"Pavucontrol", "pavucontrol"},
	   { "-----------------", false},
--	   {"1 Display", "./dotfiles/bin/awesome/display notebook"},
	   {"Work wide primary", "./dotfiles/bin/awesome/display work_screen_primary"},
--	   {"Work laptop primary", "./dotfiles/bin/awesome/display work_screen_secondary"},
	   {"Home hdmi primary", "./dotfiles/bin/awesome/display home_screen_primary"},
--	   {"Home laotop primary", "./dotfiles/bin/awesome/display home_screen_secondary"},
	   {"Only laptop", "./dotfiles/bin/awesome/display only_laptop"},
	   { "-----------------", false},
           { "Debian", debian.menu.Debian_menu.Debian },
           menu_awesome,
	   menu_apps,
           menu_terminal
        }
})

