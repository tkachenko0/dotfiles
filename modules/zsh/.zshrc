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
alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(auto)%d%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --branches --remotes --tags"
alias diff="git diff"
alias v="nvim"
alias lsa="ls -la"

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

# Brew
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH="$PATH:/home/viacheslav/.dotnet/tools"
