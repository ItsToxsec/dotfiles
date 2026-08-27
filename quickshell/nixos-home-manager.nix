# Add to your Home Manager configuration.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    quickshell
    power-profiles-daemon
    brightnessctl
    libnotify
    wl-clipboard
    wtype
    bluez
    networkmanager
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "${pkgs.bash}/bin/bash -lc '$HOME/.config/quickshell/omarchy/launch.sh'"
  ];
}
