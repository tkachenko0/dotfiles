# Dotfiles

[![Made with ÔØñ´©Å in Neovim](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F%20in%20Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

This repository contains my personal dotfiles and development environment setup.

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

## Node.js, nvm and npm

Used for Node.js version management, with setup for installing and using the latest LTS version.

## Pyenv

Used to manage Python versions easily and reproducibly across projects.

## Brew

Used to manage packages

## Custom scripts

Custom CLI scripts are available in `/usr/local/bin` and include utilities for development, git, system tweaks, etc.
