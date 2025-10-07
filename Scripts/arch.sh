#!/bin/bash

mapfile -t packages < packages.txt

echo "Installing applications..."
    for pkg in "${packages[@]}"; do
        echo "Installing $pkg..."
        sudo pacman -S --noconfirm "$pkg"
        if [ $? -ne 0 ]; then
            echo "Error installing $pkg. Skipping."
        fi
    done

echo "Application installation complete."

sudo usermod -aG docker ${USER}

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S \
    brave-bin \
    hyprshade \
    lunar-client \
    parsec-bin \
    spotify \
    tlpui \
    vial-appimage \
    visual-studio-code-bin \
    vmware-keymaps \
    vmware-host-module-dkms-git \
    vmware-host-modules-dkms-fix-git \
    vmware-workstation \
    wireshark-qt
