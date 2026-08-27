# Power profiles on NixOS

The Omarchy power panel in this port uses `powerprofilesctl` from
`power-profiles-daemon`; it does not use UPower.

Enable it in your NixOS configuration:

```nix
services.power-profiles-daemon.enable = true;
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

Verify the daemon and profiles:

```bash
powerprofilesctl list
powerprofilesctl get
```

The Quickshell panel accepts `performance`, `balanced`, and `power-saver`.
The profile setter accepts either `profile` or `source profile`; the source
(`battery`/`ac`) is only a compatibility hint and is not used to choose a
separate profile.

The battery service no longer changes the active power profile automatically.
This is intentional: selecting Performance/Power Saver in the panel must
remain selected instead of being reset by the periodic battery refresh.
