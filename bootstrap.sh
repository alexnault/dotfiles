#!/usr/bin/env zsh

function linkToHome() {
	echo "Linking dotfiles..."
	for file in {zshrc,zshenv,zprofile,zlogin,zlogout,zpreztorc,aliases,functions}; do
		if ! [ -L "${ZDOTDIR:-$HOME}/.$file" ]; then
			ln -s "${PWD}/$file" "${ZDOTDIR:-$HOME}/.$file";
		fi
	done
	echo "Dotfiles linked!"
}

read -q "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	linkToHome;
	source ~/.zshrc;
fi;

unset linkToHome;