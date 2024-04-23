#!/bin/bash

# Define the command you want to run
command="open /usr/bin/KeyChange/scripts/change.sh"

# Define the shortcut you want to use
shortcut="<Shift><Alt>"

# Create a new shortcut
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings:$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | sed -e "s/]/,'\/org\/gnome\/settings-daemon\/plugins\/media-keys\/custom-keybindings\/custom0\/']/")

# Assign the command to the shortcut
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'KeyChange shortcut'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "$command"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "$shortcut"