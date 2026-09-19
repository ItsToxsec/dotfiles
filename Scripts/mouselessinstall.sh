flatpak remote-add --user --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo

flatpak install --user flathub org.gnome.Platform//50

mouseless-install