# Brew
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$BREW_HOME:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

autoload -Uz vcs_info
precmd() { 
  vcs_info
  if [[ -n "$AWS_PROFILE" ]]; then
    AWS_INFO=" %F{214}☁  $AWS_PROFILE%f"
  else
    AWS_INFO=""
  fi
}
zstyle ':vcs_info:git:*' formats ' %F{141}%b%f'
setopt PROMPT_SUBST
PROMPT='%F{117}%~%f${vcs_info_msg_0_}${AWS_INFO} %F{84}❯%f '

# Auto cd
setopt AUTO_CD

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
bindkey '^[[Z' reverse-menu-complete

#  Aliases
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias ls="ls --color=auto"
alias lsa="ls -la"
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
  BUFFER=$(tac ~/.zsh_history | cut -d';' -f2- | awk '!seen[$0]++' | fzf --no-sort --reverse --query="$BUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

autoload -U select-word-style
select-word-style bash

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;3~' kill-word
bindkey '^[^?' backward-kill-word

# Node
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Dotnet
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"

PATH="$HOME/.local/bin:$PATH"

PATH="$HOME/.cargo/bin:$PATH"

# Plugins
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init zsh)"
