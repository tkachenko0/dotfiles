#!/bin/bash

set -e

DOTFILES_DIR=~/dev/personal/dotfiles
NEOVIM_DIR=~/.config/nvim

echo "==> Updating and installing required packages..."
sudo apt update
sudo apt install -y zsh tmux fzf curl git

echo "==> Cloning dotfiles repo..."
mkdir -p ~/dev/personal
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone https://github.com/tkachenko0/dotfiles.git "$DOTFILES_DIR"
else
  cd "$DOTFILES_DIR" && git pull
fi

echo "==> Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "==> Linking dotfiles..."
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

echo "==> Setting zsh as default shell..."
chsh -s "$(which zsh)"

echo "==> Installing pullmaster script..."
sudo ln -sf "$DOTFILES_DIR/usr/local/bin/pullmaster" /usr/local/bin/pullmaster
chmod +x "$DOTFILES_DIR/usr/local/bin/pullmaster"

echo "==> Cloning Neovim config..."
if [ ! -d "$NEOVIM_DIR" ]; then
  git clone https://github.com/tkachenko0/nvim.git "$NEOVIM_DIR"
else
  cd "$NEOVIM_DIR" && git pull
fi

echo "✅ Done! Reboot or log out and back in to apply zsh as default shell."

