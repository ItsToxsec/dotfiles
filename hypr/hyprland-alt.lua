-- Omarchy Quattro shortcut adapter for the user's Hyprland Lua config.
-- Omarchy's SUPER modifier is intentionally replaced with LEFT ALT.
-- Add these binds to your existing hyprland.lua after resolving any collisions.
local omarchyMod = "ALT"

hl.bind(omarchyMod .. " + " .. "SPACE", hl.dsp.exec_cmd("omarchy-shell shell toggle omarchy.menu '{\"menu\":\"root\"}'"))
hl.bind(omarchyMod .. " + " .. "V", hl.dsp.exec_cmd("omarchy-shell shell toggle omarchy.clipboard"))
hl.bind(omarchyMod .. " + " .. "N", hl.dsp.exec_cmd("omarchy-shell shell toggle omarchy.notifications"))

-- Workspace navigation remains with your existing ALT+number bindings.
-- Do not duplicate your existing ALT bindings; merge these selectively.
