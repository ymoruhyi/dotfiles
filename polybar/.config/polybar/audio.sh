#!/bin/bash

# Default device variable
# DEFAULT_DEVICE=$(pactl list short sinks | grep RUNNING | awk '{print $2}' | head -n 1)
DEFAULT_DEVICE=$(pactl get-default-sink)

# Check if pactl is available
if ! command -v pactl &> /dev/null; then
    echo "pactl not found!"
    exit 1
fi

# Function to get current volume
get_volume() {
    pactl get-sink-volume "$DEFAULT_DEVICE" | awk '{print $5}' | sed 's/%//'
}

# Function to check if audio is muted
is_muted() {
    pactl get-sink-mute "$DEFAULT_DEVICE" | grep -q 'Mute: yes'
    return $?
}

# Function to toggle mute
toggle_mute() {
    pactl set-sink-mute "$DEFAULT_DEVICE" toggle
}

# Function to change output device
set_output_device() {
    pactl set-default-sink "$1"
}

# Function to list available devices
list_output_devices() {
    pactl list short sinks | awk '{print $2}'
}

# Get current volume and mute status
VOLUME=$(get_volume)
MUTED=$(is_muted && echo "MUTED" || echo "UNMUTED")

# Polybar left-click for mute/unmute, right-click for device menu
case "$1" in
  "click-left")
    toggle_mute
    ;;
  "click-right")
    # Display output device menu (using rofi or any other menu system)
    DEVICE=$(list_output_devices | rofi -dmenu -p "Select output device:" -location 0 -width 30 -lines 10)
    if [[ -n "$DEVICE" ]]; then
      set_output_device "$DEVICE"
    fi
    ;;
  *)
    # Display volume and mute status in the bar
    if [[ "$MUTED" == "MUTED" ]]; then
      echo " muted"
    else
      echo "  $VOLUME%"
    fi
    ;;
esac

