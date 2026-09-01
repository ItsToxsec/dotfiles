flatpak remote-add --user --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo

flatpak install --user flathub org.gnome.Platform//50

mouseless-install

(
  cfg="$HOME/.var/app/net.sonuscape.mouseless/data/mouseless/configs/config.yaml"

  if [ "$(grep -Ec '^[[:space:]]*show overlay:' "$cfg")" != "1" ]; then
    echo "Expected one 'show overlay' entry. No changes made."
    exit 1
  fi

  cp -- "$cfg" "$cfg.bak-$(date +%Y%m%d-%H%M%S)" &&
  sed -i -E 's/^([[:space:]]*show overlay:).*$/\1 NumLock/' "$cfg" &&
  mouseless
)