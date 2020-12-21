#!/bin/bash

export DOTFILES="${HOME}/coding/dotfiles/macos"
export REPOBASE="$HOME/coding"
export GIT_USER=akind3
export GIT_EMAIL=akinthsen@gmail.com
export GIT_CREDENTIAL_HELPER=osxkeychain

command_exists() {
  command -v $1 >/dev/null 2>&1
}

# install homebrew
if ! command_exists brew ;then 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install from Brewfiles
#brew bundle


# install git 
if ! command_exists git ;then 
  echo "Install git using homebrew..."
  sleep 1
  brew install git 
  git config --global user.name $GIT_USER
  git config --global user.email $GIT_EMAIL
  git config --global credential.helper $GIT_CREDENTIAL_HELPER
fi

# setup zsh
[ -d $REPOBASE ] || mkdir -p $REPOBASE
[ -d $REPOBASE/dotfiles ] && cd $REPOBASE/dotfiles && git pull
[ ! -d $REPOBASE/dotfiles ] && cd $REPOBASE && git clone git@github.com:akind3/dotfiles.git

if ! command_exists zsh  ; then
  echo "Install zsh using homebrew..."
  sleep 1
  brew install zsh
fi


# Install oh-my-zsh
mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.`date +%Y%m%d%H%M%S`
wget  -O /tmp/ohmyzsh_install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sed -e 's/exec/#exec/g' /tmp/ohmyzsh_install.sh > /tmp/ohmyzsh_install_mod.sh
sh  /tmp/ohmyzsh_install_mod.sh 
rm -f /tmp/ohmyzsh_install_mod.sh 

# install zsh plugins...
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



# check fzf
if ! command_exists fzf ; then
  echo "Install fzf using homebrew..."
  sleep 1
  brew install fzf
  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install >/dev/null 2>&1
fi

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
rm -f $HOME/{.zshrc,.zshenv,.tmux.conf,.nvimrc,.gitconfig,.aliases}
ln -s  $DOTFILES/zsh/zshenv $HOME/.zshenv
ln -s  $DOTFILES/zsh/zshrc $HOME/.zshrc
ln -s  $DOTFILES/tmux.conf $HOME/.tmux.conf
[ -f $HOME/.config/nvim/init.vim ] && rm -f $HOME/.config/nvim/init.vim
ln -s  $DOTFILES/nvimrc $HOME/.config/nvim/init.vim
ln -s  $DOTFILES/nvimrc $HOME/.nvimrc
ln -s  $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -s  $DOTFILES/zsh/aliases.zsh $HOME/.aliases
