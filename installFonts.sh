#!/usr/bin/env bash

echo "Install fonts: start..."
mkdir -p ~/.local/share/fonts
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CodeNewRoman.zip
unzip CodeNewRoman.zip -d ~/.local/share/fonts/CodeNewRoman
unzip CascadiaCode.zip -d ~/.local/share/fonts/CascadiaCode
rm CascadiaCode.zip  CodeNewRoman.zip 
fc-cache -fv
echo "Install fonts: end!!!"


