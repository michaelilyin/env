#!/usr/bin/zsh

export unset PRIMARY_SCREEN
export unset SECONDARY_SCREEN
export unset NEED_SHUTDOWN

export LOC_HOME="HOME";
export LOC_WORK="WORK";

if hostname -A | grep -q -i relex; then
  export LOCATION="$LOC_WORK";
else
  export LOCATION="$LOC_HOME";
fi

MODE_FILE="$HOME/.config/i3/env/mode"
MODE=$(cat "$MODE_FILE")

CONNECTED_VGA=$(xrandr | grep " connected" | grep "VGA" | awk '{print$1}');
CONNECTED_HDMI=$(xrandr | grep " connected" | grep "HDMI" | awk '{print$1}');
CONNECTED_LVDS=$(xrandr | grep " connected" | grep "LVDS" | awk '{print$1}');

case "$LOCATION" in
  "$LOC_HOME")
    if [ -n "$CONNECTED_HDMI" ]; then
      export PRIMARY_SCREEN="$CONNECTED_HDMI";
      if [ "$MODE" = "multiple" ]; then
        export SECONDARY_SCREEN="$CONNECTED_LVDS";
      else
        export NEED_SHUTDOWN="$CONNECTED_LVDS"
      fi
    else
      export PRIMARY_SCREEN="$CONNECTED_LVDS";
    fi
  ;;
  "$LOC_WORK")
    export PRIMARY_SCREEN="$CONNECTED_VGA";

    if [ -n "$CONNECTED_HDMI" ] && [ "$MODE" == "multiple" ]; then
      export SECONDARY_SCREEN="$CONNECTED_HDMI";
    else
      export NEED_SHUTDOWN="$CONNECTED_HDMI"
    fi
  ;;
esac

echo LOCATION $LOCATION
echo MODE $MODE
echo PRIMARY $PRIMARY_SCREEN
echo SECONDARY $SECONDARY_SCREEN
echo NEED_SHUTDOWN $NEED_SHUTDOWN