#!/bin/bash

export DOTFILES="${HOME}/coding/dotfiles/macos"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install iterm2 zsh zplug tmux neovim
brew cask install iterm2
brew install zsh  tmux neovim 

# Install zplug if required
 ! [[ -d $HOME/.zplug ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup tmux plugin manager tpm
export TMUX_HOME=$HOME/.tmux
[ ! -d $TMUX_HOME ] && git clone https://github.com/tmux-plugins/tpm $TMUX_HOME/plugins/tpm  

# Install plug for neovim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Put dotfiles to places
DOTFILES_BASE=https://raw.githubusercontent.com/akind3/dotfiles/master/macos
[ -d $HOME/coding/dotfiles ] && rm -rf $HOME/coding/dotfiles && git clone https://github.com/akind3/dotfiles.git $HOME/coding/dotfiles
rm -f $HOME/{.zshenv, .zshrc, .aliases, .tmux.conf, .nvimrc} 
ls -s  $DOTFILES/zshenv $HOME/.zshenv
ls -s  $DOTFILES/zshrc $HOME/.zshrc
ls -s  $DOTFILES/tmux.conf $HOME/.tmux.conf 
[ -f $HOME/.config/nvim/init.vim ] && rm -f $HOME/.config/nvim/init.vim
ls -s  $DOTFILES/nvimrc $HOME/.config/nvim/init.vim
