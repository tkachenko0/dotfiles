# Brew
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

eval "$(starship init zsh)"

# Plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init zsh)"

# Auto cd
setopt AUTO_CD

#  Aliases
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias ls="ls --color=auto"
alias lsa="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias gs="git status"
alias gg="git log --graph --oneline --abbrev-commit --decorate"
alias diff="git diff"
alias v="nvim"
alias k=kubectl

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"

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

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;3~' kill-word
bindkey '^[^?' backward-kill-word        

# Node
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# Dotnet
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"

# Kiro cli
PATH="$HOME/.local/bin:$PATH"
