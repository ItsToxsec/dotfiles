-- Quickshell Quattro shortcut adapter for the user's Hyprland Lua config.
-- Quickshell's SUPER modifier is intentionally replaced with LEFT ALT.
-- Add these binds to your existing hyprland.lua after resolving any collisions.
local qsMod = "ALT"

hl.bind(qsMod .. " + " .. "SPACE", hl.dsp.exec_cmd("qs-shell shell toggle qs.menu '{\"menu\":\"root\"}'"))
hl.bind(qsMod .. " + " .. "V", hl.dsp.exec_cmd("qs-shell shell toggle qs.clipboard"))
hl.bind(qsMod .. " + " .. "N", hl.dsp.exec_cmd("qs-shell shell toggle qs.notifications"))

-- Workspace navigation remains with your existing ALT+number bindings.
-- Do not duplicate your existing ALT bindings; merge these selectively.

-- Quickshell-style lock screen. Replace any existing ALT+SHIFT+M swaylock bind with this.
hl.bind(qsMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.exec_cmd("qs-system-lock"))

-- Open Thunar on the workspace that is active when the shortcut is pressed.
hl.bind(qsMod .. " + " .. "SHIFT" .. " + " .. "F", hl.dsp.exec_cmd("bash $HOME/.config/quickshell/bin/qs-thunar-current-workspace"))
