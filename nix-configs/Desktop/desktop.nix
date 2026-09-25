{ inputs, config, pkgs, ... }:

{
  imports =
    [  # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Universal
      ../configuration.nix
      # Desktop Specific
      ./apps.nix
      ./autologin.nix
      ./steam.nix
      ./sunshine.nix
      ./windows.nix
      ./wol.nix
    ];
    networking.hostName = "nixosPC"; # Define your hostname.
}
