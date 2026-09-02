# powerButton.nix
{ config, pkgs, ... }:

{
  services.logind.settings.Login = {
    HandlePowerKey = "hibernate";
    HandlePowerKeyLongPress = "poweroff";
  };
}