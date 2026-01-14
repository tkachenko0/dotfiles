# Brew
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# Oh my zsh configs
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#  Aliases
alias gs="git status"
alias gg="git log --graph --oneline --abbrev-commit --decorate"
alias diff="git diff"
alias v="nvim"
alias lsa="ls -la"
alias k=kubectl

hurll() {
  hurl --insecure --variables-file "environments/${HURL_ENV}.env" "$@"
}

source ~/.kubectl-completion.zsh

# Scripts
export PATH="$PATH:$HOME/dev/personal/dotfiles/scripts"

bindkey -s '^F' 'tmux-sessionizer\n'        
bindkey -s '^B' 'git-branch-switcher\n'     
bindkey -s '^P' 'git-pullmaster\n'          
bindkey -s '^A' 'git-stash-lister\n'
fzf-history-widget() {
  BUFFER=$(fzf-history)
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget        

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# Dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH="$PATH:/home/viacheslav/.dotnet/tools"
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$PATH"


# Kiro cli
PATH="$HOME/.local/bin:$PATH"
