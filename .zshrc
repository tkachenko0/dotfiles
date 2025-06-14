# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cloud"
source $ZSH/oh-my-zsh.sh

# Plugins installed manually
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh

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
alias gs="git status"
alias grs="git restore . && git status"
alias gc="git commit -m"
alias gsw="git switch"
alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(auto)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --branches --remotes"
alias diff="git diff"

# Neovim aliases
alias v="nvim"
alias vim="nvim"

# Dir aliases
alias lla="lsa -la"
alias bat="batcat" 
alias ..="cd .."
alias ...="cd ../.."

# Custom scripts
bindkey -s '^F' 'tmux-sessionizer\n'        
bindkey -s '^B' 'git-branch-switcher\n'     
bindkey -s '^P' 'git-pullmaster\n'          
bindkey -s '^A' 'git-stash-lister\n'        

# Use fzf for reverse history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search  
bindkey "^[[B" down-line-or-beginning-search
fzf-history-widget() {
  BUFFER=$(fc -rl 1 | fzf --height 40% --reverse --tac | sed 's/^[ ]*[0-9]*[ ]*//')
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget
