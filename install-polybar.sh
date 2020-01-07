#!/usr/bin/zsh

VER=3.4.2

cd "$HOME" || exit
mkdir -p polybar && cd polybar || exit

rm "polybar-$VER.tar"
rm -r "polybar-$VER"
mkdir -p "polybar-$VER"

wget "https://github.com/polybar/polybar/releases/download/$VER/polybar-$VER.tar"
tar -xvf "polybar-$VER.tar" -C "polybar-$VER"

cd "polybar-$VER/polybar" || exit
./build.sh --all-features

cd "$HOME" || exit