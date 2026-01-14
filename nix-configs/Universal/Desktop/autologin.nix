{ inputs, config, pkgs, ...  }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "itstoxsec";
      };
      default_session = initial_session;
    };
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "itstoxsec";
  services.displayManager.defaultSession = "hyprland";
}
