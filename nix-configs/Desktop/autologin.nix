{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        command = "start-hyprland";
        user = "itstoxsec";
      };

      default_session = {
        command = "start-hyprland";
        user = "itstoxsec";
      };
    };
  };
}