#!/usr/bin/env zsh

echo "Installing Homebrew formulas..."

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install command-line tools
# brew install zsh
brew install wget
brew install curl
# brew install git
brew install git-crypt
brew install git-lfs
brew install imagemagick
brew install node
brew install ruby
brew install python
# brew install openssl
# brew install watchman
# brew install mongodb
brew install redis
# brew install awscli
# brew install elasticsearch

# Install GUI apps
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask vlc
# brew install --cask slack
brew install --cask iterm2
brew install --cask tower
# brew install --cask p4merge
brew install --cask ngrok
# brew install --cask macdown
brew install --cask raycast
brew install --cask rectangle
# brew install --cask skitch
brew install --cask numi
brew install --cask spotify

# Remove outdated versions from the cellar.
brew cleanup

echo "Done"
