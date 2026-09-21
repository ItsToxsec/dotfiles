---@module 'hl'
hl.on("hyprland.start", function()
    hl.exec_cmd("lxqt-policykit-agent")
    hl.exec_cmd("systemctl --user start sunshine.service")
    hl.exec_cmd([[
        case "$(hostname)" in
            nixosPC)
                exec hypridle -c "$HOME/.config/hypr/idle/desktop.conf" >> "$HOME/hypridle.log" 2>&1
                ;;
            nixosLaptop)
                exec hypridle -c "$HOME/.config/hypr/idle/laptop.conf" >> "$HOME/hypridle.log" 2>&1
                ;;
            *)
                exec hypridle -c "$HOME/.config/hypr/idle/desktop.conf" >> "$HOME/hypridle.log" 2>&1
                ;;
        esac
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
