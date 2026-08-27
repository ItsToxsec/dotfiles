# Omarchy Quattro shell — Quickshell 0.3.0 / NixOS port

This directory is a standalone port of the supplied Omarchy Quattro `shell/` tree.
It is intended for the exact Quickshell 0.3.0 API and Hyprland on NixOS.

## Start

```bash
cd ~/.config/quickshell/omarchy
./launch.sh
```

Or from Hyprland autostart:

```lua
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/quickshell/omarchy/launch.sh")
end)
```

## Left Alt

`hyprland-alt.lua` contains the Omarchy-style launcher/menu IPC bindings with
`ALT` replacing `SUPER`. Merge the binds into your existing Lua config rather
than replacing the whole file, because your current config already uses ALT.

## NixOS differences

* No dependency on `/usr/share/omarchy`.
* `OMARCHY_PATH` is set to this directory by `launch.sh`.
* Default shell state is in `config/shell.json`.
* Battery data is read directly from `/sys/class/power_supply/BAT1` instead of UPower.
* Common Omarchy helper commands are provided in `bin/` as NixOS compatibility wrappers.
* `powerprofilesctl`, `notify-send`, `wl-copy`, `wl-paste`, `bluetoothctl`, `wtype`,
  `hyprctl`, `hyprshade`, `swaylock`, and `xdg-open` are used when available.

## Quickshell configuration path

Use:

```bash
quickshell -p ~/.config/quickshell/omarchy
```

Do not use `-c` with this project.

## Important

The supplied Quattro source contains integrations with Omarchy's broader Arch
userspace. The QML has been kept intact where possible and the most important
NixOS-facing helpers have been replaced with local compatibility commands.
Optional Omarchy-specific features whose original external command has no
portable NixOS equivalent are intentionally harmless no-ops rather than shell
startup failures.

## IPC

The port keeps Quattro's single-process IPC model. Quickshell 0.3.0 exposes
`IpcHandler` from `Quickshell.Io`; the 0.3.0 documentation describes the target
map and typed IPC functions. Use `quickshell ipc -p ~/.config/quickshell/omarchy ...`
for external calls.

## Power profiles

The battery panel uses `powerprofilesctl` from `power-profiles-daemon`. Enable it
at the NixOS system level:

```nix
services.power-profiles-daemon.enable = true;
```

A ready-to-import example is included as `nixos-power-profiles.nix`. After a
`nixos-rebuild switch`, verify:

```bash
powerprofilesctl list
powerprofilesctl get
```

The panel will then show the profiles actually provided by your hardware/driver,
typically `performance`, `balanced`, and `power-saver`.
