-- MT: awesome menu file. Used in main rc.lua

local beautiful = require("beautiful")
local awful = require("awful")
local debian = require("debian.menu")

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }

mymainmenu = awful.menu({
        items = {
	   {"Screenshot", "./bin/awesome/screenshot"},
	   {"Lock", "./bin/awesome/lock_workspace"},
	   {"Leave", "./bin/awesome/leave"},
	   {"Saver", "xscreensaver"},
	   {"Suspend", "./bin/suspend"},
	   {"Terminator -u", "terminator -u"},
	   { "-----------------", false},
	   {"Pavucontrol", "pavucontrol"},
	   { "-----------------", false},
	   {"Code", "code"},
	   {"Emacs", "emacs"},
	   {"Nautilus", "nautilus"},
	   { "vifm", terminal .. " -e vifm"},
	   { "-----------------", false},
	   { "Term split 2", terminal .. " -e BYOBU_WINDOWS=split2 byobu"},
	   { "Term split 4", terminal .. " -e BYOBU_WINDOWS=split4 byobu"},
	   {"Connect_dev", "./bin/connect_dev"},
	   {"Connect_stage", "./bin/connect_stage"},
	   {"Connect_prod", "./bin/connect_prod"},
	   { "-----------------", false},
	   {"Gimp", "gimp"},
	   {"Flameshot gui", "flameshot gui"},
	   { "-----------------", false},
	   {"Firefox", "firefox"},
	   {"Chrome", "google-chrome"},
	   { "-----------------", false},
	   {"Keepassxc", "keepassxc"},
	   {"Dbeaver", "dbeaver"},
	   { "-----------------", false},
	   {"Element", "element-desktop"},
	   {"Thunderbird", "thunderbird"},
	   {"Telegram", "telegram-desktop"},
	   {"Teams-For-Linux", "teams-for-linux"},
	   {"Signal", "signal-desktop"},
	   {"Slack", "slack"},
	   {"Zoom", "zoom"},
	   { "-----------------", false},
	   {"1 Display", "./bin/awesome/display notebook"},
	   {"2 Displays", "./bin/awesome/display both"},
	   { "-----------------", false},
           { "Debian", debian.menu.Debian_menu.Debian },
           menu_awesome,
           menu_terminal,
        }
})

