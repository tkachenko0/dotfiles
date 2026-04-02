# Dotfiles

This repository contains my personal dotfiles and development environment setup.

## Setup

Copy `.env.example` to `.env` and fill in the values:

```bash
cp .env.example .env
```

Then run the setup script:

```bash
./setup
```

## WSL - Docker fix

If `docker pull` fails with:

```
error getting credentials - err: fork/exec /usr/bin/docker-credential-desktop.exe: exec format error
```

Remove `credsStore` from `~/.docker/config.json`:

```bash
sed -i '/"credsStore"/d' ~/.docker/config.json
```

This happens because Docker Desktop for Windows writes `"credsStore": "desktop.exe"` which doesn't work inside WSL.

## TODOs

- [ ] update `./windows/glazewm/config.yaml` configuration for GlazeWM
- [ ] better git workflow
- [ ] understand lua language for neovim
- [ ] rebuild neovim setup
- [ ] update neovim to latest revision
