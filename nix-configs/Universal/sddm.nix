{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";

    wayland = {
      enable = true;
      compositor = "kwin";
    };

    enableHidpi = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-icons
  ];
}
