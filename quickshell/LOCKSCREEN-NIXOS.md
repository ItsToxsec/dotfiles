# Omarchy-style lock screen on NixOS

This port uses Quickshell 0.3.0 `WlSessionLock` for the secure lock surface and
`Quickshell.Services.Pam.PamContext` for password verification.

## NixOS changes in this patch

- Password authentication uses `/etc/pam.d/login`, which NixOS already provides.
- `omarchy-system-lock` calls `qs ipc call lock lock`, so the actual Quickshell
  `WlSessionLock` plugin is used instead of `loginctl lock-session`.
- Screen blank/wake uses `hyprctl dispatch dpms off/on`.
- Fingerprint is disabled by default in this compatibility port. Password unlock
  remains available and does not require custom `/etc/pam.d/omarchy-*` files.

## Test

With the shell running:

```sh
qs ipc call lock status
qs ipc call lock preview
qs ipc call lock hidePreview
qs ipc call lock lock
```

`status` should report `passwordPam: true`.

## Hyprland Lua

Use:

```lua
hl.bind("ALT + SHIFT + M", hl.dsp.exec_cmd("omarchy-system-lock"))
```

Replace the old swaylock command on the same binding if present.
