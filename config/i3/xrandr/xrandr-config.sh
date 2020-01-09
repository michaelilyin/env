#!/usr/bin/zsh

HDMI=$(xrandr | grep "HDMI" | awk '{print$1}')
VGA_CONNECTED=$(xrandr | grep " connected" | grep "VGA" | awk '{print$1}')
HDMI_CONNECTED=$(xrandr | grep " connected" | grep "HDMI" | awk '{print$1}')

LVDS=$(xrandr | grep "LVDS" | awk '{print$1}')

if [ -n "$LVDS" ]; then
  if [ -n "$HDMI_CONNECTED" ]; then
    xrandr --output "$HDMI_CONNECTED" --primary --mode 1920x1080
    xrandr --output "$LVDS" --off
  else
    xrandr --output "$HDMI" --off
    xrandr --output "$LVDS" --primary --mode 1366x768
  fi
else
  xrandr --output "$VGA_CONNECTED" --primary --mode 1920x1080
  if [ -n "$HDMI_CONNECTED" ]; then
    xrandr --output "$HDMI_CONNECTED" --mode 1280x1024 --left-of "$VGA_CONNECTED"
  fi
fi