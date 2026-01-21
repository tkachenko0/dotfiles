# Dotfiles

This repository contains my personal dotfiles and development environment setup.

## Installation

```bash

useradd -m viacheslav
passwd viacheslav
usermod -aG sudo viacheslav
su - viacheslav

git clone https://github.com/tkachenko0/dotfiles.git ~/dev/personal/dotfiles

cd ~/dev/personal/dotfiles

# Install everything
./install.sh all

# Or install specific module
./install.sh zsh
./install.sh neovim
```

### Available Modules

- **core**: Essential packages (build tools, curl, fzf, ripgrep)
- **git**: Git configuration
- **zsh**: Zsh with oh-my-zsh and plugins
- **homebrew**: Package manager (macOS)
- **delta**: Git diff viewer
- **tmux**: Terminal multiplexer
- **nvm**: Node.js version manager
- **pyenv**: Python version manager
- **neovim**: Text editor
- **scripts**: Make custom scripts executable

## API Testing

Simple curl-based API testing framework for quick HTTP requests.

## Neovim Configuration

A submodule that contains my Neovim configuration.
Link to the submodule: [neovim-config](https://github.com/tkachenko0/nvim)

## Zsh

Custom `~/.zshrc` with plugins and theming using [oh-my-zsh](https://ohmyz.sh/), syntax highlighting, autosuggestions, and more.

## Tmux

Includes a configured `~/.tmux.conf` for a terminal multiplexing experience with custom keybindings and visuals.

`.tmux-windows` example:

```bash
rename-window frontend
send-keys 'cd ~/dev/proj/micros1/' C-m
send-keys 'nvim' C-m

new-window -n build
send-keys 'cd ~/dev/proj/micros1/' C-m
send-keys 'nvm use' C-m
send-keys 'npm run dev' C-m

select-window -t build
split-window -h
send-keys 'cd ~/dev/proj/micros1/' C-m

select-window -t frontend
```

```bash
tmux source-file ../.tmux-windows
```

## Node.js, nvm and npm

Used for Node.js version management, with setup for installing and using the latest LTS version.

## Pyenv

Used to manage Python versions easily and reproducibly across projects.

## Brew

Used to manage packages

## Custom scripts

Custom CLI scripts are available in `scripts/` and include utilities for development, git, system tweaks, etc.
