{ inputs, config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
    btop
    ciscoPacketTracer8
    distrobox
    docker
    fastfetch
    filezilla
    freerdp3
    fzf
    gh
    git
    htop
    macchanger
    mariadb
    neovim
    qemu_kvm
    qmk
    sqlite
    tldr
    tmux
    tor
    unzip
    usbutils
    virt-manager
    virtiofsd
    virtualenv
    #vmware-workstation
    vscode
    wget
    wireshark
  ];

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
  };
}
