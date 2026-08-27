# Battery patch

This build uses the actual NixOS power-supply interface at:

`/sys/class/power_supply/BAT1/`

Changes:
- The default bar entry is `omarchy.power` (the actual Quattro battery/power bar widget).
- Battery percentage display is enabled by default.
- The power panel reads BAT1 directly instead of UPower.
- The battery service reads BAT1 directly.
- The helper supports both `energy_full` and `charge_full`.

Test with:

```bash
cat /sys/class/power_supply/BAT1/capacity
cat /sys/class/power_supply/BAT1/status
```
