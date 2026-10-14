hl.window_rule({
    name = "steam-workspace",
    match = {
        class = "steam",
    },
    monitor = "DP-1",
    workspace = "13 silent",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("steam -silent")
end)
