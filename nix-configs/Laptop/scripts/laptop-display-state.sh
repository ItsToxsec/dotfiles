#!/usr/bin/env bash

set -u

INTERNAL="eDP-1"
LOG="$HOME/.local/state/laptop-display-state.log"

mkdir -p "$(dirname "$LOG")"

log() {
    printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" >> "$LOG"
}

# Hyprland must be available before we can change displays.
if ! command -v hyprctl >/dev/null 2>&1; then
    log "hyprctl unavailable; exiting"
    exit 0
fi

# Wait briefly for Hyprland/DRM to settle after resume or hotplug.
sleep 1

# -------------------------------------------------------------------
# Determine lid state
# -------------------------------------------------------------------

LID_STATE="unknown"

for lid in /proc/acpi/button/lid/*/state; do
    if [ -r "$lid" ]; then
        if grep -qi "closed" "$lid"; then
            LID_STATE="closed"
        elif grep -qi "open" "$lid"; then
            LID_STATE="open"
        fi
        break
    fi
done

# If the lid state couldn't be determined, do nothing rather than
# accidentally disabling the laptop's only usable display.
if [ "$LID_STATE" = "unknown" ]; then
    log "Unable to determine lid state; leaving displays unchanged"
    exit 0
fi

# -------------------------------------------------------------------
# Determine whether an external monitor is actually connected
# -------------------------------------------------------------------

EXTERNAL_CONNECTED=false

while IFS= read -r connector; do
    [ -e "$connector/status" ] || continue

    name="$(basename "$connector")"

    # Ignore the laptop's internal panel.
    case "$name" in
        *-"$INTERNAL")
            continue
            ;;
    esac

    if grep -qx "connected" "$connector/status" 2>/dev/null; then
        EXTERNAL_CONNECTED=true
        break
    fi
done < <(
    find /sys/class/drm \
        -maxdepth 1 \
        -type l \
        -name 'card*-*' \
        2>/dev/null
)

log "lid=$LID_STATE external=$EXTERNAL_CONNECTED"

# -------------------------------------------------------------------
# Desired state
#
# Lid open:
#     eDP-1 ON
#
# Lid closed + external display:
#     eDP-1 OFF
#
# Lid closed + no external display:
#     eDP-1 ON
#
# This deliberately prevents us from leaving the laptop with
# zero usable displays.
# -------------------------------------------------------------------

if [ "$LID_STATE" = "closed" ] && [ "$EXTERNAL_CONNECTED" = true ]; then

    log "External display available with lid closed; disabling $INTERNAL"

    hyprctl keyword monitor "$INTERNAL,disable" >> "$LOG" 2>&1

else

    log "Enabling $INTERNAL"

    # Reload your normal Hyprland monitor configuration. This is
    # preferable to hard-coding eDP-1 resolution/position/scale here.
    hyprctl reload >> "$LOG" 2>&1

fi
