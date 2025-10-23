{ inputs, config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
    audacity
    auto-cpufreq
    blueman
    brave
    brightnessctl
    btop
    cargo
    ciscoPacketTracer8
    coolercontrol.coolercontrol-gui
    coolercontrol.coolercontrold
    dfu-programmer
    dfu-util
    discord
    distrobox
    docker
    fastfetch 
    feh
    filezilla
    firefox
    fprintd
    freerdp3
    freetube
    fwupd
    fzf
    gcc
    gh
    gimp
    git
    glibc
    go
    gnome-font-viewer
    gnome-network-displays
    gnumake
    gparted
    gpg-tui
    grim
    gtk3
    gvfs
    home-manager
    htop
    hypridle
    hyprlock
    hyprland
    hyprshade
    kdePackages.sddm 
    kicad
    krita
    libreoffice-fresh
    libsecret
    # libsForQt5.kdenlive
    libvirt
    lsd
    lutris
    lunar-client #minecraft
    lxappearance
    lxqt.lxqt-policykit
    macchanger
    mariadb
    meson
    # miraclecast
    moonlight-qt
    ninja
    netcat
    networkmanagerapplet
    neovim
    nfs-utils
    nitrogen
    nodejs_20
    npins
    oh-my-zsh
    openvpn
    orca-slicer
    OVMFFull
    pamixer
    parsec-bin
    pavucontrol
    pcsx2
    picom
    pipewire
    polybar
    prismlauncher
    pulseaudio
    python3
    python312Packages.pip
    python312Packages.west
    qemu_kvm
    qmk
    rofi
    rustup
    slurp
    spotify
    sqlite
    steam
    sunshine
    swaybg
    swayidle
    swaylock-effects
    swtpm
    terminator
    thunderbird
    tldr
    tmux
    tor
    udisks
    unzip
    usbutils
    virt-manager
    virtiofsd
    #vmware-workstation
    vscode
    waybar
    wget
    wireplumber
    wireshark
    wlsunset
    wofi
    xfce.thunar
    xfce.xfwm4
    xwayland
    zoom-us
    zsh

    pkgs.xfce.thunar-volman
  ];
}
