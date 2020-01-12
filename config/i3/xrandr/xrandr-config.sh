#!/usr/bin/zsh

source ~/.config/i3/env/env.sh

PRIMARY_RESOLUTION=$(xrandr | grep -A 1 "$PRIMARY_SCREEN" | tail -n 1 | awk '{print$1}')
xrandr --output "$PRIMARY_SCREEN" --primary --mode "$PRIMARY_RESOLUTION"

if [ -n "$SECONDARY_SCREEN" ]; then
  SECONDARY_RESOLUTION=$(xrandr | grep -A 1 "$SECONDARY_SCREEN" | tail -n 1 | awk '{print$1}')
  xrandr --output "$SECONDARY_SCREEN" --primary --mode "$SECONDARY_RESOLUTION"

  case "$LOCATION" in
    "$LOC_HOME")
      xrandr --output "$SECONDARY_SCREEN" --left-of "$PRIMARY_SCREEN"
    ;;
    "$LOC_WORK")
      xrandr --output "$SECONDARY_SCREEN" --left-of "$PRIMARY_SCREEN"
    ;;
  esac
fi

if [ -n "$NEED_SHUTDOWN" ]; then
  xrandr --output "$NEED_SHUTDOWN" --off
fi