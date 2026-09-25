{ config, pkgs, lib, ... }:

{
  services.sunshine = {
    enable = true;
    autoStart = true;

    # Needed for KMS capture on Wayland / Hyprland
    capSysAdmin = true;

    # Let the NixOS Sunshine module open the required ports
    openFirewall = true;
  };

  # Make Sunshine start with the graphical user session.
  systemd.user.services.sunshine = {
    wantedBy = [ "graphical-session.target" ];

    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
  };
}