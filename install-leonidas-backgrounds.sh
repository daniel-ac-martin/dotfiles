#! /bin/bash

set -e

sudo dnf install -y \
  leonidas-backgrounds \
  leonidas-backgrounds-common \
  leonidas-backgrounds-lion \
  leonidas-backgrounds-lion-dual

gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/leonidas/leonidas.xml'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/leonidas/lion/normal/2048x1536/leonidas-1-noon_right.jpg'
