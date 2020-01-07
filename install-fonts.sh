#!/bin/sh

srcdir="fonts"
pkgdir="/usr/share/fonts/truetype/material-icons"

echo "Installing fonts..."
sudo mkdir -p $pkgdir
sudo find $srcdir -type f -name "*.ttf" -exec install -Dm644 {} $pkgdir \;

echo "Updating font-cache..."
sudo fc-cache -f > /dev/null

echo "Done!"