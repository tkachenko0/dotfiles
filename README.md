# Dotfiles

See the `./Dockerfile` for the base image or the `./bootstrap.sh` script for the installation steps.

To bootstrap your environment, you can run the following commands.
If not inside a Docker container, with sudo privileges.

```bash
apt-get update
apt-get upgrade -y
apt install -y git

mkdir -p ~/dev/personal
mkdir -p ~/.config

git clone https://github.com/tkachenko0/dotfiles.git ~/dev/personal/dotfiles

chmod +x ~/dev/personal/dotfiles/bootstrap.sh
~/dev/personal/dotfiles/bootstrap.sh
```

## Neovim Configuration

[![Made with ÔØñ´©Å in Neovim](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F%20in%20Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

This is my personal Neovim setup, heavily inspired by [ThePrimeagen's](https://github.com/ThePrimeagen/neovimrc) configuration.

A fast, modular Neovim configuration powered by lazy.nvim. Features full TypeScript development support with Prettier and ESLint integration, git status with Gitsigns, environment variable hiding with Cloak, advanced search with Telescope, powerful syntax highlighting with Treesitter, diagnostics with Trouble, session management with Undotree, fast navigation with Harpoon, and more.

![image](https://github.com/user-attachments/assets/5f1fb7a1-b763-476b-8b59-a0e6986d4371)

### Installation

This is part of my dotiles and rc files.

The repo for installing all my dotfiles is available at [dotiles](https://github.com/tkachenko0/dotfiles).

## Zsh

## Tmux

## Node.js, nvm and npm

## Pyenv

## Brew

## Custom scripts

## Inspirations

- [ThePrimeagen's Neovim Config](https://github.com/ThePrimeagen/neovimrc)
