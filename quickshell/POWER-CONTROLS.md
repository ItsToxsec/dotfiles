# Power controls

The bar now includes `omarchy.power-controls` on the right side. Clicking the power icon opens the existing `omarchy.menu` `system` submenu.

Available actions:
- Lock
- Suspend
- Hibernate
- Suspend then hibernate
- Hybrid sleep
- Reboot
- Shutdown

These use systemd commands (`systemctl ...`) and do not require UPower.

## NixOS note

Hibernate and the sleep variants only work if the running NixOS kernel/system configuration supports them. If `systemctl hibernate` is unavailable on your machine, remove the corresponding entries from `config/omarchy-menu.jsonc`.

## NixOS power actions

The power menu now routes lock, suspend, hibernate, suspend-then-hibernate,
hybrid-sleep, reboot, and poweroff through the local `omarchy-system-*`
wrappers. These invoke `systemctl` directly and do not require UPower.
