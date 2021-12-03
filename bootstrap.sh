#!/usr/bin/env zsh

dir_name=${0:a:h}

function linkToHome() {
	echo "Linking dotfiles..."
	for file in {zshrc,zshenv,zprofile,zlogin,zlogout,aliases,functions,localaliases,localfunctions}; do
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
