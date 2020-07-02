#!/bin/bash

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

 Put dotfiles to places
DOTFILES_BASE=https://raw.githubusercontent.com/akind3/dotfiles/master/macos
rm -f $HOME/{.zshrc, .tmux.conf, .nvimrc, .aliases} 
curl -fLo $HOME/.zshrc --create-dirs  $DOTFILES_BASE/zshrc
curl -fLo $HOME/.tmux.conf --create-dirs  $DOTFILES_BASE/tmux.conf
curl -fLo $HOME/.config/nvim/init.vim --create-dirs  $DOTFILES_BASE/nvimrc
ln -s $HOME/.config/nvim/init.vim  $HOME/.nvimrc
curl -fLo $HOME/.aliases --create-dirs  $DOTFILES_BASE/aliases
