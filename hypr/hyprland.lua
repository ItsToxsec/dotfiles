---@module 'hl'
local home = os.getenv("HOME")
local hypr = home .. "/.config/hypr"

local handle = io.popen("hostname")
local hostname = handle:read("*a"):gsub("%s+", "")
handle:close()

if hostname == "nixosLaptop" then
    dofile(hypr .. "/monitors/laptop.lua")
elseif hostname == "nixosPC" then
    dofile(hypr .. "/monitors/desktop.lua")
else
    hl.monitor({ output = "", mode = "highres", position = "auto", scale = 1.0 })
end

dofile(hypr .. "/config/input.lua")
dofile(hypr .. "/config/appearance.lua")
dofile(hypr .. "/config/layout.lua")
dofile(hypr .. "/binds/apps.lua")
dofile(hypr .. "/binds/windows.lua")
dofile(hypr .. "/binds/workspaces.lua")
dofile(hypr .. "/binds/media.lua")
dofile(hypr .. "/binds/quickshell.lua")
dofile(hypr .. "/startup.lua")
