export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/dev/personal/dotfiles/scripts:$PATH"

# Vi mode
bindkey -v

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect '\t' menu-complete
bindkey -M menuselect '\e[Z' reverse-menu-complete

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

for f in \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/fzf/key-bindings.zsh \
  "$(brew --prefix 2>/dev/null)/opt/fzf/shell/key-bindings.zsh"; do
  [ -r "$f" ] && source "$f" && break
done

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{141}%b%f'
setopt PROMPT_SUBST
PROMPT='%F{117}%~%f${vcs_info_msg_0_} %F{84}❯%f '

# Aliases
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias lsa="ls -la"
alias gs="git status"
alias gg="git log --graph --oneline --abbrev-commit --decorate"
alias diff="git diff"
alias v="nvim"
alias k="kubectl"
alias "??"="claude"

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"

# Scripts
bindkey -s '^F' 'tmux-sessionizer\n'        
bindkey -s '^P' 'git-sync\n'          
bindkey -s '^N' 'git-branch-switcher\n'     
bindkey -s '^A' 'git-stash-lister\n'

# Node
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Dotnet
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"

# Plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
