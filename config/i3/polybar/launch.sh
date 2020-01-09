#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

VGA_CONNECTED=$(xrandr | grep " connected" | grep "VGA" | awk '{print$1}')
HDMI_CONNECTED=$(xrandr | grep " connected" | grep "HDMI" | awk '{print$1}')

LVDS=$(xrandr | grep "LVDS" | awk '{print$1}')

if [ -n "$LVDS" ]; then
  if [ -n "$HDMI_CONNECTED" ]; then
    PRIMARY_SCREEEN="$HDMI_CONNECTED" polybar primary &
  else
    PRIMARY_SCREEEN="$LVDS" polybar primary &
  fi
else
  PRIMARY_SCREEEN="$VGA_CONNECTED" polybar primary &
  if [ -n "$HDMI_CONNECTED" ]; then
    SECONDARY_SCREEEN="$HDMI_CONNECTED" polybar secondary &
  fi
fi
