#!/usr/bin/env bash
#
# Symlinks the dotfiles into $HOME and installs antidote. Safe to re-run.
#

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES=(zshenv zprofile zshrc)

# Remove symlinks into this repo that are no longer managed (e.g. old Prezto files)
for link in "$HOME"/.[!.]*; do
	[[ -L $link ]] || continue
	[[ $(readlink "$link") == "$DOTFILES"/* ]] || continue
	name=${link##*/.}
	if [[ ! " ${FILES[*]} " == *" $name "* ]]; then
		rm "$link"
		echo "Removed stale link $link"
	fi
done

for file in "${FILES[@]}"; do
	target="$HOME/.$file"
	if [[ -e $target && ! -L $target ]]; then
		mv "$target" "$target.bak"
		echo "Backed up $target to $target.bak"
	fi
	ln -sfn "$DOTFILES/$file" "$target"
done
echo "Linked ${FILES[*]}"

antidote_dir="${XDG_DATA_HOME:-$HOME/.local/share}/antidote"
if [[ -d $antidote_dir ]]; then
	git -C "$antidote_dir" pull --ff-only --quiet
else
	git clone --depth=1 --quiet https://github.com/mattmc3/antidote.git "$antidote_dir"
fi
echo "antidote ready at $antidote_dir"

echo "Done. Open a new terminal or run: exec zsh -l"
