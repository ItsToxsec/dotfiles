{ lib, ... }:

{
  powerManagement.enable = true;
  systemd.sleep.settings.Sleep = {
    AllowHibernation = "yes";
    AllowSuspendThenHibernate = "yes";
  };
}
