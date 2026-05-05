{ inputs, config, pkgs, ... }:

{
  networking = {
    interfaces.enp193s0f3u1.useDHCP = false;
    interfaces.enp193s0f3u1.ipv4.addresses = [{
      address = "192.168.0.3";
      prefixLength = 24;
    }];
    defaultGateway = "192.168.0.1";
  };
}
