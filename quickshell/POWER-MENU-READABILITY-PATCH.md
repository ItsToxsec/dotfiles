# Power menu readability patch

The bar power button continues to open `omarchy.menu` with `menu=system`, but the System submenu now contains exactly five actions:

- Lock
- Suspend
- Hibernate
- Reboot
- Power Off

Removed from this menu:

- Suspend then hibernate
- Hybrid sleep

Battery power profiles remain in the separate `omarchy.power` battery panel and were not changed by this patch.
