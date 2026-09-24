#!/run/current-system/sw/bin/bash


# Turn all monitors off
hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'

sleep 2

# Turn all monitors back on
hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'