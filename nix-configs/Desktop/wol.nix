{ config, pkgs, ... }:

{
  # Wake-on-LAN tools
  environment.systemPackages = with pkgs; [
    ethtool
    wakeonlan
  ];

  # Enable Wake-on-LAN whenever the Ethernet interface comes online.
  networking.networkmanager.dispatcherScripts = [
    {
      source = pkgs.writeShellScript "enable-wake-on-lan" ''
        INTERFACE="$1"
        ACTION="$2"

        if [ "$ACTION" = "up" ]; then
          ${pkgs.ethtool}/bin/ethtool -s "$INTERFACE" wol g 2>/dev/null || true
        fi
      '';
      type = "basic";
    }
  ];

  # Also enable it during boot.
  systemd.services.enable-wake-on-lan = {
    description = "Enable Wake-on-LAN";

    wantedBy = [ "multi-user.target" ];
    after = [ "network-pre.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      for interface in /sys/class/net/*; do
        interface="$(basename "$interface")"

        # Ignore loopback and wireless interfaces.
        [ "$interface" = "lo" ] && continue
        [ -d "/sys/class/net/$interface/wireless" ] && continue

        ${pkgs.ethtool}/bin/ethtool -s "$interface" wol g 2>/dev/null || true
      done
    '';
  };
}