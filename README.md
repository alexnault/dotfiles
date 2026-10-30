# Dotfiles

Minimal, fast zsh configuration for MacOS, Linux and Windows (WSL).

No framework: plain zsh plus a few plugins loaded by [antidote](https://github.com/mattmc3/antidote) from a static bundle.

## Requirements

+ [zsh](https://www.zsh.org/) and git
+ [fnm](https://github.com/Schniz/fnm) (optional, Node version manager)

macOS:

```bash
brew install fnm
```

Linux:

```bash
sudo apt install zsh git && chsh -s "$(command -v zsh)"
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
```

## Installation

```bash
git clone https://github.com/alexnault/dotfiles.git ~/Projects/dotfiles
~/Projects/dotfiles/install.sh
```

`install.sh` symlinks `zshenv`, `zprofile` and `zshrc` into `$HOME` (backing up real files to `*.bak`) and installs antidote. Re-run it any time.

## Files

| File | Purpose |
|---|---|
| `zshenv` | Every shell. Minimal. |
| `zprofile` | Login shells. Environment and `PATH`. |
| `zshrc` | Interactive shells. Options, history, completion, keys, prompt. |
| `zsh_plugins.txt` | Plugin list. The bundle regenerates when this file changes. |
| `aliases`, `functions` | Sourced from `zshrc`. |

## Machine-specific config

Put anything local to a machine (work aliases, SDK paths, installer snippets) in `~/.zshrc.local`. It is sourced last and is not part of this repo.

Installers that append to `~/.zshrc` will write into this repo through the symlink. Move those lines to `~/.zshrc.local`.

## Updating plugins

```bash
antidote update
```

## License

MIT
