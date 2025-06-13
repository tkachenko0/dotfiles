# Dotfiles

[![Made with ÔØñ´©Å in Neovim](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F%20in%20Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

This repository contains my personal dotfiles and development environment setup.

You can find the base Docker image in the `./Dockerfile` and the setup steps in the `./bootstrap.sh` script.

## Bootstrap Instructions

To set up your environment (requires `sudo` if not inside a Docker container), run:

```bash
apt-get update
apt-get upgrade -y
apt install -y git

mkdir -p ~/dev/personal
mkdir -p ~/.config

git clone https://github.com/tkachenko0/dotfiles.git ~/dev/personal/dotfiles

chmod +x ~/dev/personal/dotfiles/bootstrap
~/dev/personal/dotfiles/bootstrap
```

## Neovim Configuration

This is my personal Neovim setup, heavily inspired by [ThePrimeagen's](https://github.com/ThePrimeagen/neovimrc) configuration.

A fast, modular Neovim configuration powered by lazy.nvim. Features full TypeScript development support with Prettier and ESLint integration, git status with Gitsigns, environment variable hiding with Cloak, advanced search with Telescope, powerful syntax highlighting with Treesitter, diagnostics with Trouble, session management with Undotree, fast navigation with Harpoon, and more.

Here’s the refactored and expanded list of features, grouped by category and clearly labeled for readability:

### 🚀 Features

#### 🧠 Core Development Tools

- **LSP** support for intelligent code completion, diagnostics, and refactoring
- **Telescope** for powerful fuzzy finding and live grep
- **Treesitter** for advanced syntax highlighting and code understanding
- **Undotree** for visual undo history and session management
- **Trouble** for managing LSP diagnostics, references, and quickfixes

#### 🛠️ Language & Framework Support

- **TypeScript / JavaScript** with full Prettier + ESLint integration
- **Python** support with `pyright`, `isort`, and `black`
- **Angular** development support with relevant LSP and formatting
- **LSP** tooling is configured for smooth integration across multiple languages

#### 🎯 Linters & Formatters

- **ESLint** for JavaScript/TypeScript linting
- **Prettier** for consistent formatting (JS/TS/HTML/CSS)
- **Black** and **isort** for Python formatting
- **Diffview** to visualize git diffs within Neovim

#### 🔐 Git & Secrets

- **Gitsigns** for inline git status and blame
- **Diffview** for reviewing diffs and history
- **Cloak** to hide sensitive environment variables in `.env` files

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

## Inspirations

- [ThePrimeagen's Neovim Config](https://github.com/ThePrimeagen/neovimrc)
