# Dotfiles

Ergonomic Mac OS configuration.

## Requirements

+ [Homebrew](https://brew.sh/)
+ [Prezto](https://github.com/sorin-ionescu/prezto)

Install **Homebrew**:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install **Prezto**:

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh
```

## Installation

+ Clone repository:

```bash
git clone git://github.com/alexnault/dotfiles.git ~/.dotfiles
```

+ Link **dotfiles**:

```bash
source ~/.dotfiles/bootstrap.sh
```

+ Install **Homebrew** formulas:

```bash
source ~/.dotfiles/brew.sh
```

+ Configure **Mac OS** defaults:

```bash
source ~/.dotfiles/macos.sh
```

## Inspired by:

+ https://github.com/mathiasbynens/dotfiles
+ https://github.com/sorin-ionescu/dotfiles

## License

MIT
