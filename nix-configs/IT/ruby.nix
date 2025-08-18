{ inputs, config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
    ruby
    rubyPackages.racc
    rubyPackages.rails
    rubyPackages.rbs
  ];
}
