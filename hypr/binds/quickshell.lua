---@module 'hl'
local mainMod = "ALT"

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(
    "qs ipc call shell toggle qs.menu '{\"menu\":\"root\"}'"
))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(
    "bash $HOME/.config/quickshell/bin/qs-system-lock"
))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("qs-shell shell toggle qs.clipboard"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("qs-shell shell toggle qs.notifications"))
