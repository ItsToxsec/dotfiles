---@module 'hl'
local mainMod = "ALT"

hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + ALT + J", hl.dsp.group.next())
hl.bind("SUPER + ALT + K", hl.dsp.group.next({ forward = false }))
hl.bind(mainMod .. " + T", hl.dsp.group.toggle())

-- Resize in 10-pixel increments
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
