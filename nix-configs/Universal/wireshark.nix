{ inputs, config, pkgs, ... }:

{
  # Wireshark
  programs.wireshark.enable = true;
  users.groups.wireshark = {};
}