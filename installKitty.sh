#!/usr/bin/env bash

echo "Install kitty: start..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y kitty
kitty --version
echo "Setting open kitty here"
sudo apt install -y python3-pip python3-nautilus
pip install --user nautilus-open-any-terminal
nautilus -q
glib-compile-schemas ~/.local/share/glib-2.0/schemas/
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
echo "Install kitty: end!!!"
