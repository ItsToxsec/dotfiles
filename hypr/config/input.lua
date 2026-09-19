---@module 'hl'
hl.env("XCURSOR_SIZE", 14)
hl.config({ input = {
    kb_layout = "us", follow_mouse = 1,
    touchpad = { natural_scroll = true },
    sensitivity = 0,
}})
hl.device({ name = "logitech-m570", sensitivity = -0.75 })
hl.device({ name = "epic-mouse-v1" })
hl.config({ cursor = { no_hardware_cursors = 1 } })
