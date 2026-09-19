{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;

    wayland = {
      enable = false;
    };

    enableHidpi = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-icons
  ];
}
