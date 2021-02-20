#! /bin/bash

set -e

# sudo dnf install -y flatpak # Already installed on Fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.slack.Slack
