{ inputs, config, lib, pkgs, ... }:
  
  let
  cfg = config.programs.sunshine;
  in

{
  boot.supportedFilesystems = [ "ntfs" ];
  #  boot.kernelParams = [
  # "amd_iommu=on"
  # "iommu=pt"
  # "vfio-pci.ids=10de:2484,10de:228b"
  #];


  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # ZSH
  users.defaultUserShell=pkgs.zsh;
  programs.zsh = {
      enable = true;
      shellAliases = {
        vim = "nvim";
        ll = "ls -la";
        clc = "clear";
        update = "sudo nixos-rebuild switch";
      };
      ohMyZsh = {
        enable = true;
        #theme = "strug";
        plugins = [
        ];
      };
    };
   programs.zsh.shellInit = "~/dotfiles/.zshrc";

  programs.steam.enable = true;
  # virtualisation.vmware.host.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Logitech Unifying
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Fprint Unlock
  services.fprintd.enable = true;

  # FWUPD
  services.fwupd.enable = true;

  # Dark Theme
  environment.variables.GTK_THEME = "Adwaita:dark";  # 
  
  # Wireshark
  programs.wireshark.enable = true;
  users.groups.wireshark = {};

  # QMK
  hardware.keyboard.qmk.enable = true;

  # USB
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  
}
