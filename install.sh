#!/bin/bash

#install zsh
sudo apt install -y i3
sudo apt install -y zsh terminator
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install -y scrot feh rofi brightnessctl bc lm-sensors
sudo cp ./rules/backlight.rules /etc/udev/rules.d/
sudo usermod -aG video "$USER"

sudo apt install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2

sudo apt install -y fonts-font-awesome unifont

sudo add-apt-repository ppa:amanusk/python-s-tui
sudo apt update
sudo apt install -y python3-s-tui

# autoremove
sudo apt autoremove -y