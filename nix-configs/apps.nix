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
    ciscoPacketTracer8
    dfu-programmer
    dfu-util
    discord
    fastfetch 
    feh
    filezilla
    firefox
    fprintd
    freerdp3
    freetube
    fwupd
    fzf
    gimp
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
    kdePackages.kcolorchooser
    kdePackages.sddm 
    #kicad
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
    meson
    # miraclecast
    moonlight-qt
    ninja
    nerd-fonts.caskaydia-cove
    netcat
    networkmanagerapplet
    neovim
    nfs-utils
    nitrogen
    npins
    oh-my-zsh
    openvpn
    orca-slicer
    pam_u2f
    pamixer
    parsec-bin
    pavucontrol
    pcsx2
    picom
    pipewire
    polybar
    prismlauncher
    pulseaudio
    qemu_kvm
    qmk
    rofi
    slurp
    spotify
    steam
    swaybg
    swayidle
    swaylock-effects
    terminator
    thunderbird
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
    waybar
    wireplumber
    wireshark
    wlsunset
    wofi
    xfce.thunar
    xfce.xfwm4
    xwayland
    zsh
  ];
}
