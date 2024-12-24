#!/bin/bash

# Define the options and corresponding commands
# dpi:96 - 100% - looks better on external monitor
# dpi:144 - 150% - looks better on built-in monitor
declare -A options=(
    ["HDMI-1 primary"]="xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal && echo \"Xft.dpi: 96\" > ~/.Xresources && xrdb -merge ~/.Xresources"
    ["eDP-1 primary"]="xrandr --output HDMI-1 --off --output eDP-1 --primary --mode 2880x1800 --pos 0x0 --rotate normal && echo \"Xft.dpi: 144\" > ~/.Xresources && xrdb -merge ~/.Xresources"
)

# Display the options in Rofi
choice=$(printf "%s\n" "${!options[@]}" | rofi -dmenu -p -i "Select monitor setup")

# Execute the corresponding command
if [[ -n $choice && -n ${options[$choice]} ]]; then
    eval "${options[$choice]}"
else
    echo "Invalid choice or no selection made."
fi
