#
# Sourced by login shells, before zshrc. Environment and PATH go here.
#

# Homebrew on Apple Silicon
if [[ -x /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export LANG=${LANG:-en_US.UTF-8}

# Deduplicate PATH entries
typeset -gU path fpath

path=(~/.local/bin $path)
