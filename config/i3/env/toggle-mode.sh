#!/usr/bin/zsh

MODE_FILE="$HOME/.config/i3/env/mode"
MODE=$(cat "$MODE_FILE")

case "$MODE" in
  "single")
    echo multiple > "$MODE_FILE"
  ;;
  "multiple")
    echo single > "$MODE_FILE"
  ;;
esac

i3-msg reload
i3-msg restart
