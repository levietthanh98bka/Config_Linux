#!/usr/bin/env bash

# Source path
SCRIPT_PATH=$(realpath "$(dirname $0)")
ALL_CONFIGS=${SCRIPT_PATH}/configs

# Config home
USER_CONFIGS=$HOME/.config

CONFIGS=("fish" "kitty" "nvim" "bash")

append_bashrc() {
	LINE='source "$HOME/.config/bash/init.sh"'
	BASHRC="$HOME/.bashrc"

	if ! grep -Fxq "$LINE" "$BASHRC"; then
		echo "$LINE" >>"$BASHRC"
	fi
	source $BASHRC
}

setup_dotfiles() {
	echo "Setup dotfiles."
	echo "--------------------------------------"

	if test $(pwd) != $SCRIPT_PATH; then
		echo "cd $SCRIPT_PATH"
		cd ${SCRIPT_PATH}
		echo "--------------------------s------------"
	fi

	echo "Backup or unlink old config"
	for config in "${CONFIGS[@]}"; do
		local conf_path=${USER_CONFIGS}/${config}
		local conf_path_bak=${USER_CONFIGS}/${config}.bak

		if [[ -L $conf_path ]]; then
			echo "unlink $conf_path"
			unlink $conf_path
		elif [[ -d $conf_path ]]; then
			rm -rf $conf_path_bak
			echo "Rename: $conf_path -> $conf_path_bak"
			mv $conf_path $conf_path_bak
		fi
	done
	echo "--------------------------------------"

	echo "Symlink new configs"
	for config in "${CONFIGS[@]}"; do
		echo "Create symlink: ${USER_CONFIGS}/${config} -> ${ALL_CONFIGS}/${config}"
		ln -s ${ALL_CONFIGS}/${config} ${USER_CONFIGS}/${config}
	done
	echo "--------------------------------------"
	append_bashrc
	echo "set -g KFC_GIT_STATUS true" | tee ~/.config/fish/conf.d/user_config.fish
	echo
	echo "Completed."
}

installFish() {
	echo "Install fish: start..."
	sudo add-apt-repository ppa:fish-shell/release-3 -y
	sudo apt update
	sudo apt install -y fish
	fish --version
	echo
	echo "Install fish complete!!!"
}

installNeovim() {
	echo "Install Neovim: start..."
	sudo add-apt-repository -y ppa:neovim-ppa/Sunstable
	sudo apt update
	sudo apt install -y neovim
	nvim --version
	echo
	echo "Install Neovim complete!!!"
}

installKitty() {
	echo "Install kitty: start..."
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y kitty
	kitty --version
	echo "Setting open kitty here"
	sudo apt install -y python3-pip python3-nautilus
	pip install nautilus-open-any-terminal --break-system-packages
	nautilus -q
	glib-compile-schemas ~/.local/share/glib-2.0/schemas/
	gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
	echo
	echo "Install Kitty complete!!!"
}

installFonts() {
	echo "Install fonts: start..."
	mkdir -p ~/.local/share/fonts
	cd ~/Downloads
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip
	wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CodeNewRoman.zip
	unzip CodeNewRoman.zip -d ~/.local/share/fonts/CodeNewRoman
	unzip CascadiaCode.zip -d ~/.local/share/fonts/CascadiaCode
	rm CascadiaCode.zip CodeNewRoman.zip
	fc-cache -fv
	echo
	echo "Install fonts: end!!!"
}

main() {

	while true; do
		echo "====================Setup Ubuntu===================="
		echo "1: Install common(git,g++,gcc) "
		echo "2: Install Fish"
		echo "3: Install Kitty"
		echo "4: Install Neovim"
		echo "5: Install Fronts"
		echo "6: Config dotfile"
		echo "0: Exit"

		read -p "Choose: " choose

		case "$choose" in
		1)
			echo "Install common: start..."
			sudo apt update
			sudo apt install -y gcc g++
			sudo apt install -y git
			echo "Install common: end!!!"
			;;
		2)
			installFish
			;;
		3)
			installKitty
			;;
		4)
			installNeovim
			;;
		5)
			installFonts
			;;
		6)
			setup_dotfiles
			;;
		0)
			echo "exit"
			exit
			;;
		*)
			echo "Invalid input"
			;;
		esac

	done
}

main