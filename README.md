# Dotfiles

```bash
apt update
apt upgrade -y

apt install -y git

mkdir -p ~/dev/personal
mkdir ~/.config

DOTFILES_DIR=~/dev/personal/dotfiles
git clone https://github.com/tkachenko0/dotfiles.git "$DOTFILES_DIR"

git clone https://github.com/tkachenko0/nvim.git ~/.config/nvim
```
