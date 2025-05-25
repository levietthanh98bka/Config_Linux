#!/usr/bin/env bash

echo "Install fish: start..."
sudo add-apt-repository ppa:fish-shell/release-3 -y
sudo apt update
sudo apt install -y fish
fish --version
echo "Install fish: end!!!"
