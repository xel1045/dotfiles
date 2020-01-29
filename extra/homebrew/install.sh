#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew); then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" > /tmp/homebrew-install.log
fi

# Install homebrew casks
brew cask install \
  adoptopenjdk

# Install homebrew packages
brew install \
  adr-tools \
  aws-shell \
  bfg \
  carthage \
  coreutils \
  dive \
  exiftool \
  figlet \
  git \
  git-extras \
  git-flow \
  hub \
  ncdu \
  php-cs-fixer \
  spark \
  thefuck \
  tldr

exit 0
