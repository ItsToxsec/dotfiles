{ config, lib, pkgs, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;

      extraEntries = {
        "windows.conf" = ''
          title Windows 11
          sort-key y_windows
          efi /EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };

    timeout = 5;
  };
}