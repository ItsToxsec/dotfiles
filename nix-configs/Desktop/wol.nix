{ inputs, config, pkgs, ...  }:

{
  networking = {
    interfaces = {
      enp12s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
    };
  };
}
