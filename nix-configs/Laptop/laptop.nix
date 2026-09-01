{ inputs, config, pkgs, ... }:

{
  # logind settings
  services.logind.settings.Login = {
    lidSwitchDocked = "suspend";
    lidSwitch = "suspend";
  };
  
  services.logind.lidSwitch = "suspend"; # Options: "suspend", "ignore", "poweroff", "hibernate", etc.

  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
      disableWhileTyping = true;
      clickMethod = "clickfinger";
    };
  };
  services.fprintd.enable = true;
}
