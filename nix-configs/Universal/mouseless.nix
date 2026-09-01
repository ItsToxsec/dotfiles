# NixOS wrapper for https://github.com/cymian/mouseless
# Uses the official Linux Flatpak; no flakes or Home Manager required.
#
# Save as /etc/nixos/mouseless.nix, then add to configuration.nix:
#   imports = [ ./mouseless.nix ]; # Merge into your existing imports.
#   programs.mouseless = {
#     enable = true;
#     users = [ "YOUR_USERNAME" ]; # Existing accounts needing Wayland input.
#   };
{ config, lib, pkgs, ... }:
let
  cfg = config.programs.mouseless;
  flatpak = config.services.flatpak.package;
  appId = "net.sonuscape.mouseless";
  appRef = "${appId}//${cfg.branch}";

  launcher = pkgs.writeShellApplication {
    name = "mouseless";
    runtimeInputs = [ flatpak ];
    text = ''
      if ! flatpak info --user ${lib.escapeShellArg appRef} >/dev/null 2>&1; then
        echo 'Mouseless is not installed for this user. Run mouseless-install first.' >&2
        exit 1
      fi
      exec flatpak run --user --branch=${lib.escapeShellArg cfg.branch} ${appId} "$@"
    '';
  };

  installer = pkgs.writeShellApplication {
    name = "mouseless-install";
    runtimeInputs = [ flatpak ];
    text = ''
      if [ "$EUID" -eq 0 ]; then
        echo 'Run mouseless-install as your desktop user, without sudo.' >&2
        exit 1
      fi
      flatpak remote-add --user --if-not-exists sonuscape \
        https://dl.sonuscape.net/flatpak/sonuscape.flatpakrepo
      flatpak install --user sonuscape ${lib.escapeShellArg appRef}
    '';
  };
in
{
  options.programs.mouseless = {
    enable = lib.mkEnableOption "Mouseless through its official Flatpak";
    branch = lib.mkOption {
      type = lib.types.enum [ "stable" "preview" ];
      default = "stable";
      description = "Flatpak release branch installed and launched by the wrappers.";
    };
    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [ "alice" ];
      description = "Existing normal users granted raw input access on Wayland.";
    };
    waylandInput.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable upstream's input-group and uinput permissions for Wayland.";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    {
      services.flatpak.enable = true;
      xdg.portal.enable = true;
      # Fallback for generic portals; retain compositor-specific backends.
      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      environment.systemPackages = [ launcher installer ];
      # The upstream Flatpak supplies the application-menu desktop entry.
    }
    (lib.mkIf cfg.waylandInput.enable {
      assertions = [
        {
          assertion = cfg.users != [ ];
          message = "programs.mouseless.users must list a desktop user when waylandInput.enable is true.";
        }
      ] ++ map (name: {
        assertion = lib.attrByPath [ name "isNormalUser" ] false config.users.users;
        message = "programs.mouseless.users: ${name} must be an existing normal user.";
      }) cfg.users;

      boot.kernelModules = [ "uinput" ];
      users.groups.mouseless = { };
      users.groups.input = { };
      users.users = lib.genAttrs cfg.users (_: {
        extraGroups = [ "input" "mouseless" ];
      });
      services.udev.extraRules = ''
        KERNEL=="uinput", GROUP="mouseless", MODE:="0660"
      '';
    })
  ]);
}
