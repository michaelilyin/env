#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

source ~/.config/i3/env/env.sh

echo LOCATION $LOCATION
echo PRIMARY $PRIMARY_SCREEN
echo SECONDARY $SECONDARY_SCREEN

polybar primary &

if [ -n "$SECONDARY_SCREEN" ]; then
  polybar secondary &
fi
