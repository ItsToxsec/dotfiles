#!/run/current-system/sw/bin/bash

if hyprctl monitors | grep -q 'eDP-1'; then
  if [[ "$1" == "close" ]]; then
    hyprctl keyword monitor "eDP-1,disable"
  elif [[ "$1" == "open" ]]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
  fi
fi