{ inputs, config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
    coolercontrol.coolercontrol-gui
    coolercontrol.coolercontrold
    ethtool
    node-gyp
    sunshine
    wakeonlan
  ];
  programs.coolercontrol.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-6.0.36"
  ];

}
