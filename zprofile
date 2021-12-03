#
# Executes commands at login pre-zshrc.
#

#
# Editors
#

export VISUAL=vim
export EDITOR="$VISUAL"
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
	/usr/local/{bin,sbin}
	$path
)
