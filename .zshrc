if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud"

plugins=(
	git
 	zsh-autosuggestions
        z
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

alias v="nvim"
alias vim="nvim"
alias lsd="lsd --tree -A --depth 1"
alias lla="lsa -la"
alias bat="batcat" 
alias gs="git status"
alias diff="git diff"
alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(auto)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gsw="git switch"

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
