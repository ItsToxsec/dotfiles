# Three-profile power picker patch

The power panel now exposes only:

- Battery Saver (`power-saver`)
- Balanced (`balanced`)
- Performance (`performance`)

The NixOS helper strictly filters `powerprofilesctl list` output so metadata such as Driver, PlatformDriver, and Degraded can never appear as selectable profiles.
