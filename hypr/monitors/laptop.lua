hl.monitor({
    output   = "eDP-1",
    mode     = "highres",
    position = "auto",
    scale    = 1.33,
})

hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@240",
    position = "0x0",
    scale    = 1.0,
})

-- Laptop lid display handling
hl.bind(
    "switch:on:Lid Switch",
    hl.dsp.exec_cmd(
        "bash $HOME/.config/hypr/scripts/lid-display.sh close"
    ),
    { locked = true }
)

hl.bind(
    "switch:off:Lid Switch",
    hl.dsp.exec_cmd(
        "bash $HOME/.config/hypr/scripts/lid-display.sh open"
    ),
    { locked = true }
)