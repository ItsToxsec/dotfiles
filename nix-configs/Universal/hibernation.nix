{ lib, ... }:

{
  swapDevices = lib.mkForce [
    { device = "/dev/disk/by-uuid/31de2b3e-7f19-4c3f-ac1c-3ac0e96c4d5d"; }
  ];
  boot.resumeDevice = "/dev/disk/by-uuid/31de2b3e-7f19-4c3f-ac1c-3ac0e96c4d5d";
  powerManagement.enable = true;
  systemd.sleep.settings.Sleep = {
    AllowHibernation = "yes";
    AllowSuspendThenHibernate = "yes";
  };
}
