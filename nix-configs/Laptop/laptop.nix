{ inputs, config, pkgs, ... }:

{
  imports =
    [  # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./apps.nix
      ./hibernate.nix
      ./laptop-settings.nix
      ../configuration.nix
    ];
    networking.hostName = "nixosLaptop"; # Define your hostname.
}