#!/usr/bin/zsh

HDMI=$(xrandr | grep "HDMI" | awk '{print$1}')
HDMI_CONNECTED=$(xrandr | grep " connected" | grep "HDMI" | awk '{print$1}')

LVDS=$(xrandr | grep "LVDS" | awk '{print$1}')

if [ -n "$LVDS" ]; then
  if [ -n "$HDMI_CONNECTED" ]; then
    xrandr --output "$HDMI" --primary --mode 1920x1080
    xrandr --output "$LVDS" --off
  else
    xrandr --output "$HDMI" --off
    xrandr --output "$LVDS" --primary --mode 1366x768
  fi
fi
