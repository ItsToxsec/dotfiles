---@module 'hl'
local mainMod = "ALT"
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("terminator"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
