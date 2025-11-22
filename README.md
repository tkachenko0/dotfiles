# Dotfiles

[![Made with ÔØñ´©Å in Neovim](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F%20in%20Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

This repository contains my personal dotfiles and development environment setup.

To pull all the repo:

```bash
git clone --recurse-submodules git@github.com:tkachenko0/dotfiles.git ~/dev/personal/dotfiles
```

To update the submodules after cloning:

```bash
git submodule update --remote --merge
git add .
git push
```

## Bootstrap Instructions to Test inside Docker

To test the setup inside a Docker container, you can use the provided Dockerfile. This will create a container with all the necessary tools and configurations pre-installed.

```bash
docker build -t test-dev .
```

Then run the container with:

```bash
docker run --rm -it --name test-config test-dev
```

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

## SQL Workflow

Terminal-based PostgreSQL query execution system.

### Setup

1. Create `connections.conf` in your project root:

```
local=postgresql://postgres:postgres@localhost:5432/aaa-local
staging=postgresql://user:pass@host:5432/db
```

### Usage

```bash
export VIA_DB_CONN=local

# Run queries
sql-run query.sql
sql-run -i
```
