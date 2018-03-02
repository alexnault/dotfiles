#!/usr/bin/env zsh

dir_name=${0:a:h}

ln -sf "$dir_name/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "$dir_name/vscode/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json
