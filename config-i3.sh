#!/usr/bin/zsh

cp -r ./config/polybar "$HOME/.config"
cp -r ./config/i3 "$HOME/.config"
cp ./profile "$HOME/.profile"

i3-msg reload
i3-msg restart

# TODO:
#  * vsync
#  * colors
#  * icons (for ui)
#  * fonts (only mat)