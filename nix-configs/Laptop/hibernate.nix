{ config, pkgs, ... }:

{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 36 * 1024;
    }
  ];

  boot.resumeDevice =
    "/dev/disk/by-uuid/b62acdee-a724-4886-8180-ee67ebb20660";

  boot.kernelParams = [
    "resume_offset=137146368"
  ];

  systemd.tmpfiles.rules = [
    "w /sys/power/disk - - - - shutdown"
  ];
}