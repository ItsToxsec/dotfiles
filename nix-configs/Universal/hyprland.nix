{inputs, config, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
      enable = true;
      xwayland = {
          enable = true;
      };
        #systemd.enable = false;
  };
}
