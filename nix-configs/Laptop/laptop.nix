{ inputs, config, pkgs, ... }:

{
  imports =
    [  # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./Laptop/apps.nix
      ./Laptop/hibernate.nix
      ./Laptop/laptop-settings.nix
    ];
}