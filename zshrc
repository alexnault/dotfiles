#
# Sourced by interactive shells.
#

# Repository directory, resolved through the ~/.zshrc symlink
DOTFILES=${${(%):-%x}:A:h}

#
# Options
#

setopt auto_cd              # `dir` alone cds into it
setopt auto_pushd           # cd pushes onto the dir stack (cd -<Tab>)
setopt pushd_ignore_dups
setopt pushd_silent
setopt interactive_comments # allow # comments at the prompt
setopt no_beep

#
# History
#

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt extended_history     # save timestamps
setopt share_history        # share across open shells
setopt hist_ignore_all_dups
setopt hist_ignore_space    # commands starting with a space are not saved
setopt hist_reduce_blanks
setopt hist_verify          # show !! expansions before running

#
# Plugins (antidote)
#

ANTIDOTE_DIR=${XDG_DATA_HOME:-~/.local/share}/antidote
if [[ -d $ANTIDOTE_DIR ]]; then
	fpath=($ANTIDOTE_DIR/functions $fpath)
	autoload -Uz antidote

	# Regenerate the static bundle only when the plugin list changes
	zsh_plugins=${XDG_CACHE_HOME:-~/.cache}/zsh/plugins.zsh
	if [[ ! $zsh_plugins -nt $DOTFILES/zsh_plugins.txt ]]; then
		mkdir -p ${zsh_plugins:h}
		antidote bundle <$DOTFILES/zsh_plugins.txt >|$zsh_plugins
	fi
	source $zsh_plugins
	unset zsh_plugins
fi

#
# Completion
#

autoload -Uz compinit
# Full rebuild of the completion dump at most once a day
() {
	setopt local_options extended_glob
	if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
		compinit
	else
		compinit -C
	fi
}

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-~/.cache}/zsh/compcache
_comp_options+=(globdots)   # complete hidden files

#
# Key bindings
#

bindkey -e

# Option+Delete stops at / like other macOS apps
WORDCHARS=${WORDCHARS//\/}

bindkey '^[[1;3C' forward-word         # Option+→ (iTerm2)
bindkey '^[[1;3D' backward-word        # Option+←
bindkey '^[[1;5C' forward-word         # Ctrl+→ (Linux)
bindkey '^[[1;5D' backward-word        # Ctrl+←
bindkey '^[[H'    beginning-of-line    # Home
bindkey '^[[1~'   beginning-of-line
bindkey '^[[F'    end-of-line          # End
bindkey '^[[4~'   end-of-line
bindkey '^[[3~'   delete-char          # forward Delete
bindkey '^[[Z'    reverse-menu-complete # Shift+Tab

# ↑/↓ search history for the typed text anywhere in a command
if (( $+widgets[history-substring-search-up] )); then
	HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
	bindkey '^[[A' history-substring-search-up
	bindkey '^[OA' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	bindkey '^[OB' history-substring-search-down
fi

#
# Prompt
#

autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{green}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{green}%b%f %F{yellow}%a%f'
add-zsh-hook precmd vcs_info

setopt prompt_subst
PROMPT=$'%F{blue}%~%f${vcs_info_msg_0_}\n%(?.%F{magenta}.%F{red})❯%f '

#
# Tools
#

if (( $+commands[fnm] )); then
	eval "$(fnm env --use-on-cd --shell zsh)"
fi

#
# Aliases, functions and machine-specific config
#

source $DOTFILES/aliases
source $DOTFILES/functions
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
