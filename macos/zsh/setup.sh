#!/bin/bash
# setup zsh
command_exists() {
  command -v $1 >/dev/null 2>&1
}

# install homebrew
if ! command_exists brew ;then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ -d $REPOBASE/dotfiles ] ; then
  cd $REPOBASE/dotfiles && git pull
else 
  cd $REPOBASE &&  git clone git@github.com/dotfiles.git
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
rm -f $HOME/{.zshrc, .zshenv}
ln -s  $DOTFILES/zsh/zshenv $HOME/.zshenv
ln -s  $DOTFILES/zsh/zshrc $HOME/.zshrc
