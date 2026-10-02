sudo mkdir -p /mnt/windows-efi
sudo mount /dev/nvme1n1p1 /mnt/windows-efi #nvmen1p1 is the windows drive

ls /mnt/windows-efi/EFI/Microsoft/Boot/

sudo mkdir -p /boot/EFI/Microsoft
sudo cp -a /mnt/windows-efi/EFI/Microsoft/. /boot/EFI/Microsoft/

ls -l /boot/EFI/Microsoft/Boot/bootmgfw.efi

sudo nixos-rebuild boot -I nixos-config=/home/$USER/dotfiles/nix-configs/Desktop/pxe-desktop.nix

bootctl list