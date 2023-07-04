#!/usr/bin/env zsh

dir_name=${0:a:h}

function linkToHome() {
	echo "Linking dotfiles..."
	mkdir "${ZDOTDIR:-$HOME}/.config";
	for file in {zshrc,zshenv,zprofile,zlogin,zlogout,zpreztorc,aliases,functions,localaliases,localfunctions,config/yabai,config/skhd}; do
		ln -sf "$dir_name/$file" "${ZDOTDIR:-$HOME}/.$file";
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
