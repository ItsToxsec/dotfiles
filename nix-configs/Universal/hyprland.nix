{inputs, config, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland = {
          enable = true;
      };
        #systemd.enable = false;
  };
}
