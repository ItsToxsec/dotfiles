
#!/run/current-system/sw/bin/bash

# Pipewire
SOURCE=$(pamixer --list-sources | grep "Running" )
SOURCEMUTE=$(pamixer --list-sources | grep "Suspended" )
VOLUME=$(pamixer --get-volume "${SOURCE}")
SINK=$(pamixer --list-sinks | grep "Running")

if [ SOURCEMUTE == SOURCE ]; then
    echo "  MUTED"
else
    echo "  ${VOLUME}%"
fi
