#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-}"

HYPRCTL="$(command -v hyprctl)"

# Count active external monitors.
external_count="$(
  "$HYPRCTL" monitors all -j |
    jq '[.[] | select(.name != "eDP-1" and .disabled == false)] | length'
)"

case "$ACTION" in
  close)
    # Only disable the internal screen if an external display is active.
    if [ "$external_count" -gt 0 ]; then
      "$HYPRCTL" dispatch 'hl.monitor({ output = "eDP-1", disabled = true })'
    fi
    ;;

  open)
    # Re-enable the internal display.
    "$HYPRCTL" dispatch \
      'hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1.33 })'
    ;;

  *)
    echo "usage: $0 close|open" >&2
    exit 2
    ;;
esac