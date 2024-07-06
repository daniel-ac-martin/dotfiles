#! /bin/bash

set -e

# sudo dnf install -y flatpak # Already installed on Fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub
flatpak install flathub org.signal.Signal
