#!/usr/bin/env bash

echo "Install Neovim: start..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim
nvim --version
echo "Install Neovim: end!!!"
