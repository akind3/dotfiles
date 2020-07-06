#!/bin/bash
command_exists() {
  command -v $1 >/dev/null 2>&1
}

# install homebrew
if ! command_exists brew ;then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

REPOS=$HOME/coding
if [ -d $REPOS/dotfiles ] ; then 
  cd $REPOS/dotfiles && git pull 
else 
  cd $REPOS &&  git clone git@github.com/dotfiles.git 
fi

if ! command_exists zsh  ; then
  echo "Install zsh using homebrew..."
  sleep 1
  brew install zsh
fi

# Install zplug if required
 ! [[ -d $HOME/.zplug ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Put dotfiles to places
DOTFILES="${HOME}/coding/dotfiles/macos/zsh"
rm -f $HOME/{.zshrc, .zshenv}
ln -s  $DOTFILES/zshenv $HOME/.zshenv
ln -s  $DOTFILES/zshrc $HOME/.zshrc
