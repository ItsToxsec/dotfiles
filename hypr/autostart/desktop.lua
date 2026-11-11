hl.window_rule({
    name = "steam-workspace",
    match = {
        class = "steam",
    },
    monitor = "DP-1",
    workspace = "3",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("sh -c 'sleep 15; steam -pipewire -silent'")
end)
