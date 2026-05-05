{ inputs, config, pkgs, ...  }:

{
    services.sunshine = {
        enable = true;
        autoStart = true;
        capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
        openFirewall = true;
    };
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 47984 47989 47990 48010 48999 ];
        allowedUDPPorts = [ 47989 47998 47999 48000 ];
    };
}
