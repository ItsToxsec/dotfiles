---@module 'hl'
local mainMod = "ALT"

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

for i = 1, 9 do
    hl.bind(mainMod .. " + F" .. i, hl.dsp.focus({ workspace = 10 + i }))
end
hl.bind(mainMod .. " + F10", hl.dsp.focus({ workspace = 110 }))

for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

for i = 1, 9 do
    hl.bind(mainMod .. " + CTRL + SHIFT + " .. i, hl.dsp.window.move({ workspace = 10 + i }))
end
hl.bind(mainMod .. " + CTRL + SHIFT + 0", hl.dsp.window.move({ workspace = 110 }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("ALT + P", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("ALT + O", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("ALT + U", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("ALT + I", hl.dsp.workspace.move({ monitor = "d" }))