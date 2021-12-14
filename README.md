# Dotfiles

Ergonomic shell configuration for MacOS and Linux (with Windows support through WSL).

## Requirements

+ [zsh](https://www.zsh.org/)
+ [Prezto](https://github.com/sorin-ionescu/prezto)

Install **zsh**:

```bash
sudo apt-get install zsh
chsh -s /bin/zsh
```

Install **Prezto**:

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

## Installation

1. Clone the repository:

```bash
git clone git://github.com/alexnault/dotfiles.git ~/.dotfiles
```

2. Symlink the dotfiles to your home directory:

```bash
source ~/.dotfiles/bootstrap.sh
```

## Inspired by:

+ https://github.com/mathiasbynens/dotfiles
+ https://github.com/sorin-ionescu/dotfiles

## License

MIT
