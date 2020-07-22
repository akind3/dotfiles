#!/bin/bash

export DOTFILES="${HOME}/coding/dotfiles/macos"
export REPOS_BASE="$HOME/coding"

command_exists() {
  command -v $1 >/dev/null 2>&1
}

# install homebrew
if ! command_exists brew ;then 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install from Brewfiles
brew bundle

# setup zsh
[ -d $REPOBASE/dotfiles ] && cd $REPOBASE/dotfiles && git pull
[ -d $REPOBASE ] || mkdir -p $REPOBASE && cd $REPOBASE && git clone git@github.com/dotfiles.git

if ! command_exists zsh  ; then
  echo "Install zsh using homebrew..."
  sleep 1
  brew install zsh
fi

# Install zplug if required
[ ! -d $HOME/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Install oh-my-zsh
[ ! -d $HOME/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# check tmux
if ! command_exists tmux ; then
  echo "Install tmux using homebrew..."
  sleep 1
  brew install tmux
fi

# Setup tmux plugin manager tpm
export TMUX_HOME=$HOME/.tmux
[ ! -d $TMUX_HOME ] && git clone https://github.com/tmux-plugins/tpm $TMUX_HOME/plugins/tpm  

# check neovim
if ! command_exists nvim ; then
  echo "Install neovim using homebrew..."
  sleep 1
  brew install neovim
fi

# Install plug for neovim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Put dotfiles to places
[ -d $HOME/coding/dotfiles ] && rm -rf $HOME/coding/dotfiles && git clone https://github.com/akind3/dotfiles.git $HOME/coding/dotfiles
rm -f $HOME/{.zshrc, .zshenv, .tmux.conf, .nvimrc, .gitconfig, .aliases}
ln -s  $DOTFILES/zsh/zshenv $HOME/.zshenv
ln -s  $DOTFILES/zsh/zshrc $HOME/.zshrc
ls -s  $DOTFILES/tmux.conf $HOME/.tmux.conf
[ -f $HOME/.config/nvim/init.vim ] && rm -f $HOME/.config/nvim/init.vim
ls -s  $DOTFILES/nvimrc $HOME/.config/nvim/init.vim
ls -s  $DOTFILES/nvimrc $HOME/.nvimrc
ls -s  $DOTFILES/git/gitconfig $HOME/.gitconfig
ls -s  $DOTFILES/zsh/aliases.zsh $HOME/.aliases
