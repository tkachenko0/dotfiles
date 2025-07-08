# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cloud"

plugins=(
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Brew
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Git aliases
alias gs="git status -s"
alias grs="git restore . && git status"
alias gc="git commit -m"
alias gsw="git switch"
alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(auto)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --branches --remotes --tags"
alias diff="git diff"

# Neovim aliases
alias v="nvim"

# Dir aliases
alias lsa="ls -la"
alias lsd="lsd --tree -a --depth 1"
alias bat="batcat" 
alias ..="cd .."
alias ...="cd ../.."

# Custom scripts
bindkey -s '^F' 'tmux-sessionizer\n'        
bindkey -s '^B' 'git-branch-switcher\n'     
bindkey -s '^P' 'git-pullmaster\n'          
bindkey -s '^A' 'git-stash-lister\n'        

# Minimal fuzzy history search with fzf
fzf-history-widget() {
  BUFFER=$(fc -rl 1 | fzf --reverse --tac | sed 's/^[[:space:]]*[0-9]*[[:space:]]*//')
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget
