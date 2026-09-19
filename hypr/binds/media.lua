---@module 'hl'
local mainMod = "ALT"

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("print", hl.dsp.exec_cmd("grim -g $(slurp) \"$HOME/Pictures/Screenshots/$(date +'%s_grim.png')\""))
hl.bind(mainMod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprshade on blue-light-filter"))
hl.bind(mainMod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprshade off"))
hl.bind(mainMod .. " + CTRL + M", hl.dsp.exec_cmd("~/dotfiles/hypr/scripts/lid.sh"))
