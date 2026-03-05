export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/dev/personal/dotfiles/scripts:$PATH"

# Vi mode
set -o vi

# History
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -n"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

fzf-history-widget() {
  READLINE_LINE=$(tac ~/.bash_history | awk '!seen[$0]++' | fzf --no-sort --reverse --query="$READLINE_LINE")
  READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-r": fzf-history-widget'

# Prompt
git_branch() {
  git branch 2>/dev/null | grep '^*' | sed 's/* //'
}

PS1='\[\e[38;5;117m\]\w\[\e[0m\]$(branch=$(git_branch); [ -n "$branch" ] && echo " \[\e[38;5;141m\]$branch\[\e[0m\]") \[\e[38;5;84m\]❯\[\e[0m\] '

# Aliases
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias lsa="ls -la"
alias gs="git status"
alias gg="git log --graph --oneline --abbrev-commit --decorate"
alias diff="git diff"
alias v="nvim"
alias k="kubectl"
function _ask_ai() { kiro-cli chat "$*"; }
alias "??"="_ask_ai"

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"

# Scripts
bind -x '"\C-f": tmux-sessionizer'
bind -x '"\C-b": git-branch-switcher'
bind -x '"\C-p": git-pullmaster'
bind -x '"\C-a": git-stash-lister'

# Node
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell bash)"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Dotnet
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"
