#!/bin/bash

shortcut="<Shift><Alt>"

current_shortcuts=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

# Loop through each custom shortcut
for binding in $current_shortcuts
do
    # Get the shortcut for the current binding
    binding_shortcut=$(gsettings get org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$binding binding)

    # Check if the shortcut matches the one you're looking for
    if [ "$binding_shortcut" = "'$shortcut'" ]
    then
        echo "Shortcut exists"
		exist=1
        exit 0
    fi
done


if [ $exist = 0 ]
then
	$(bash shortcut.sh)
fi


if [ -z "$(setxkbmap -print | grep '+us+')" ]; then
	$(setxkbmap us)
	echo "cs > us" >> /usr/bin/KeyChange/log
else
	$(setxkbmap cz)
	echo "us > cs" >> /usr/bin/KeyChange/log
fi
