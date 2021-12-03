#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source files
for file in ~/.{aliases,functions,localaliases,localfunctions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;