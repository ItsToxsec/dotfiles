# Import this from your NixOS system configuration if you want the
# Performance / Balanced / Power Saver buttons in the Quickshell power panel.
{ ... }:
{
  services.power-profiles-daemon.enable = true;
}
