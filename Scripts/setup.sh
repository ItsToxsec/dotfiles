sudo pacman -Sy gnome-themes
yay -Sy adwaita-qt5-git adwaita-qt6-git

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

sudo pacman -S qemu-full qemu-img libvirt virt-install virt-manager virt-viewer edk2-ovmf dnsmasq swtpm guestfs-tools libosinfo tuned

sudo usermod -a -G libvirt itstoxsec

for drv in qemu interface network nodedev nwfilter secret storage; do
    sudo systemctl enable virt${drv}d.service;
    sudo systemctl enable virt${drv}d{,-ro,-admin}.socket;
done

sudo systemctl enable --now libvirtd.service

sudo virt-host-validate qemu

sudo modprobe -r kvm_amd
sudo modprobe kvm_amd nested=1

