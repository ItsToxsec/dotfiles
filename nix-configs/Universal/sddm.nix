{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;

    wayland = {
      enable = true;
    };

    enableHidpi = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-icons
  ];
}
