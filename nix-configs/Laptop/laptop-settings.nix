{ inputs, config, pkgs, ... }:

{
  services.logind.settings.Login = {
    # On battery / undocked:
    # suspend immediately, then hibernate after 5 minutes
    HandleLidSwitch = "suspend-then-hibernate";

    # While charging:
    HandleLidSwitchExternalPower = "suspend-then-hibernate";

    # While docked:
    HandleLidSwitchDocked = "suspend-then-hibernate";
  };

  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "5min";
  };
  
  #services.logind.lidSwitch = "suspend"; # Options: "suspend", "ignore", "poweroff", "hibernate", etc.

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
