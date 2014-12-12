#!/bin/sh
# file: run.sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install cask
brew install caskroom/cask/brew-cask

CASK_DIR="./cask"

# install xcode tools
xcode-select --install

# install all brews
while read p; do
  brew install $p
done < brew.txt

# install all casks
while read p; do
  brew cask install $p
  if [ -d $CASK_DIR/$p ]
    then
    if [ -f $CASK_DIR/$p/$p.sh ]
      then
      $CASK_DIR/$p/$p.sh
    fi
  fi
done < cask.txt

# brew cask alfred link
