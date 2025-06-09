# Dotfiles

- tmux installed with brew because apt gets not last version

- another usefull plugin: `https://dandavison.github.io/delta/introduction.html`
  This is my configurtion:

```bash
 ln -s ~/dev/personal/dotfiles/.zshrc ~/.zshrc
 sudo ln -s ~/dev/personal/dotfiles/usr/local/bin/tmux-sessionizer /usr/local/bin/tmux-sessionizer
 ln -s ~/dev/personal/dotfiles/.tmux.conf ~/.tmux.conf
```

```bash
# config for delta (the tool to view diffs with git diff)
[core]
    pager = delta
    editor = nvim
[interactive]
     diffFilter = delta --color-only
[delta]
    navigate = true    # use n and N to move between diff sections
    side-by-side = true
    hunk-header-style = omit
    syntax-theme = Visual Studio Dark+
    dark = true
```

```bash
# From https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
apt install zsh

# From https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
