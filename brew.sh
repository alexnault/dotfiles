#!/usr/bin/env zsh

echo "Installing Homebrew formulas..."

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install command-line tools
brew install zsh
brew install wget
brew install curl
brew install git
brew install git-crypt
brew install imagemagick
brew install node
brew install ruby
brew install python
brew install openssl
brew install watchman
brew install mongodb
brew install awscli
# brew install elasticsearch

# Install GUI apps
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install vlc
brew cask install slack
brew cask install iterm2
brew cask install tower
brew cask install p4merge
brew cask install ngrok
brew cask install macdown
brew cask install alfred
brew cask install spectacle
brew cask install skitch
brew cask install numi

# Remove outdated versions from the cellar.
brew cleanup

echo "Done"
