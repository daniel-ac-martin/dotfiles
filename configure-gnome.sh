#! /bin/bash

set -euo pipefail

# Show the day of the week
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Allow right clicks with trackpad
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
