#!/bin/bash

if ! which brew > /dev/null 2>&1 ; then 
  exit 1
fi

REPOS=$HOME/coding
if [ -d $REPOS/dotfiles ] ; then 
  cd $REPOS/dotfiles && git pull 
else 
  cd $REPOS &&  git clone git@github.com/dotfiles.git 
fi

if ! which zsh  ; then 
  brew install zsh
fi

# Install zplug if required
 ! [[ -d $HOME/.zplug ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Put dotfiles to places
DOTFILES="${HOME}/coding/dotfiles/macos/zsh"
rm -f $HOME/.zshrc
rm -f $HOME/.zshenv
ln -s  $DOTFILES/zshenv $HOME/.zshenv
ln -s  $DOTFILES/zshrc $HOME/.zshrc
