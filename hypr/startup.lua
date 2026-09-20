---@module 'hl'
hl.on("hyprland.start", function()
    hl.exec_cmd("lxqt-policykit-agent")
    hl.exec_cmd([[
        if [ "$(hostname)" = "nixosLaptop" ]; then
            hypridle -c ~/.config/hypr/idle/desktop.conf >> ~/hypridle.log 2>&1
        elseif hostname == "nixosPC" then
            hypridle -c ~/.config/hypr/idle/laptop.conf >> ~/hypridle.log 2>&1
        fi
        else
            hypridle -c ~/.config/hypr/hypridle.conf >> ~/hypridle.log 2>&1
        end
    ]])
    hl.exec_cmd("brave")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("qs")
    hl.exec_cmd("mouseless")
end)

hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme Adwaita")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
    hl.exec_cmd("hyprshade auto")
end)
