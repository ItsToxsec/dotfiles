hl.monitor({
    output   = "",
    mode     = "highres",
    position = "auto",
    scale    = 1.0,
})

hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@240",
    position = "0x0",
    scale    = 1.0,
})

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080",
    position = "3440x-1080",
    scale    = 1.000,
    transform = 3,
})

hl.monitor({
    output   = "DP-3",
    mode     = "2560x1080",
    position = "880x-1080",
    scale    = 1.00,
    transform = 2,
})