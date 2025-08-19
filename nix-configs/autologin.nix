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
}
