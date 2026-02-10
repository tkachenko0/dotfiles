# Dotfiles

This repository contains my personal dotfiles and development environment setup.

## Installation

```bash

useradd -m viacheslav
passwd viacheslav
usermod -aG sudo viacheslav
su - viacheslav

git clone git@github.com:tkachenko0/dotfiles.git  ~/dev/personal/dotfiles

cd  ~/dev/personal/dotfiles

# Install everything
./setup all

# Or install a specific module
./setup zsh
./setup neovim
```

### Available Modules

- **core**: Essential packages (build tools, curl, fzf, ripgrep, jq, tree)
- **git**: Git configuration
- **ssh**: SSH config and key management
- **zsh**: Zsh with plugins
- **dev-tools**: Development tools (Hurl, Terraform, Go, Rust)
- **delta**: Git diff viewer
- **tmux**: Terminal multiplexer
- **fnm**: Node.js version manager
- **pyenv**: Python version manager
- **dotnet**: .NET SDK
- **neovim**: Text editor
- **scripts**: Make custom scripts executable
