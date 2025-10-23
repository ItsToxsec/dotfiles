{ inputs, config, pkgs, ... }:

{
  # logind settings
  services.logind = {
    lidSwitchDocked = "suspend";
    lidSwitch = "suspend";
  };

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
}