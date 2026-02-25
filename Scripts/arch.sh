sudo pacman -S git zsh waybar polybar brightnessctl unzip nfts-3g neovim fastfetch swaybg nitrogen wlsunset slurp grim distrobox docker

sudo usermod -aG docker ${USER}

pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
