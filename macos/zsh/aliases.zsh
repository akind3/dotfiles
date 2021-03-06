alias pyc='pycharm'
alias jdot="cd $DOTFILES/coding/dotfiles/macos"
alias hg='history | grep'
alias ll="ls -la"
alias mrg='rg --column --line-number --no-heading --color=always --smart-case '
alias sshc7='ssh ckt@c7work'
# alias pip3='/usr/local/bin/python3 -m pip'
# alias pip='/usr/local/bin/python3 -m pip'
alias venv='/usr/local/bin/python3 -m venv --copies '
alias ctags="`brew --prefix`/bin/ctags"
alias vim="/usr/local/bin/nvim"
alias vi="/usr/local/bin/nvim" 
alias gs="git status"
alias gc="git checkout"
alias gs="git status"
alias gut='git rm -r --cached'
# alias staust = 'gitst'
alias gcf="git config"
alias gft="git fetch"
alias gbr="git branch"
alias gbrv="git branch --v"
alias ggeturl="git config --get remote.origin.url"
# alias bs = bisect
alias glg="git log --pretty=fuller"
alias gcfg="git config --global"
# alias cfga = config --global alias.
alias gpu="git pull"
# alias gcm="git commit -c HEAD"
alias gps="git push"
alias gls="git ls-remote --heads"
# alias gudc="git reset HEAD~"
alias gftg="git fetch --tags"
alias gam="git commit -amend"
alias gcmd="git commit --amend"
alias grsh="git reset HEAD~"
alias gcmi="git  commit --interactive -c HEAD --reset-author"
alias gi="git --interactive"
alias grss="git reset --soft"
alias grmc="git rm --cached"
alias gcp="git cherry-pick"
alias gcpx="git cherry-pick -x"
alias gbl="git blame"
alias ggk="git gitk"
alias gltn="git ls-tree -r HEAD~ --name-only"
alias glt="git ls-tree -r HEAD~ --name-only"
alias gltng="git ls-tree -r HEAD~ --name-only |grep"
alias glgd="git log -p --full-diff"
alias gnpm="npm -g --save-dev" 
alias npm="npm -g --save-dev" 
alias lnpm="npm --save-dev" 

special_git_clone() {
    git clone --no-checkout https://github.com/$1.git tmp
    mv tmp/.git .
    rmdir tmp
    git reset --hard HEAD
}
alias sgc="special_git_clone"
