#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install Python
brew install python
brew install gcc
brew install swig
brew install pkg-config
brew install git
brew install node
brew install wget
brew install heroku-toolbelt
heroku update

brew install caskroom/cask/brew-cask

# Core casks
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" wireshark

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook

# Remove outdated versions from the cellar.
brew cleanup
