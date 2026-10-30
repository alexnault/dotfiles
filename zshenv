#
# Sourced by every zsh, including scripts. Keep it minimal.
#

# Ubuntu's /etc/zsh/zshrc runs its own compinit unless told not to.
skip_global_compinit=1

# Linux terminals usually open non-login shells, which skip zprofile.
if [[ $SHLVL -eq 1 && ! -o login && -r ~/.zprofile ]]; then
	source ~/.zprofile
fi
