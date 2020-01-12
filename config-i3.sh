#!/usr/bin/zsh

cp -r ./config/polybar "$HOME/.config"
cp -r ./config/i3 "$HOME/.config"

cp ./profile "$HOME/.profile"
chmod u+rx "$HOME/.profile"

MODE_FILE="$HOME/.config/i3/env/mode"
MODE=$(cat "$MODE_FILE")
echo "${MODE:=single}" > "$MODE_FILE"

i3-msg reload
i3-msg restart

# TODO:
#  * vsync
#  * icons (for ui)
#  * fonts (only mat)