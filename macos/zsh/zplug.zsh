export ZPLUG_HOME=$HOME/.zplug
source ${ZPLUG_HOME}/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "themes/bira", as:theme, from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh 
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "lib/completion", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "b4b4r07/emoji-cli"
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
# fzf
zplug 'junegunn/fzf', \
      as:command, \
      use:'bin/{fzf,fzf-tmux}', \
      if:"[[ $OSTYPE == linux* || $OSTYPE == darwin* ]]", \
      hook-build:'./install --key-bindings --completion --no-update-rc', \
      defer:2
zplug "junegunn/fzf", from:github, use:"shell/completion.zsh", defer:2 
zplug "junegunn/fzf", from:github, use:"shell/key-bindings.zsh", defer:2 
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# zplug check returns true if the given repository exists
if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
fi

# load plugins
# zplug load --verbose 
zplug load 
