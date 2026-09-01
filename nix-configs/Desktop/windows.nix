{ config, lib, pkgs, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;

      windows = {
        "windows" = {
          title = "Windows 11";

          # Replace this with the device handle for your
          # Windows EFI System Partition.
          #
          # Example:
          #   HD0c3
          #
          # Find it by booting into the EDK2 UEFI Shell
          # and running:
          #
          #   map -c
          #
          # Then check partitions for:
          #
          #   EFI\Microsoft\Boot\bootmgfw.efi
          #
          efiDeviceHandle = "HD0c3";

          # Places Windows below the normal NixOS entries.
          sortKey = "y_windows";
        };
      };

      # Provides the UEFI shell used to determine the
      # Windows drive's EFI device handle.
      edk2-uefi-shell = {
        enable = true;
        sortKey = "z_edk2";
      };
    };

    # Show the boot menu for 5 seconds.
    timeout = 5;
  };
}