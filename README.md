# Dotfiles

This repository contains my personal dotfiles and development environment setup.

```bash
curl -fsSL https://raw.githubusercontent.com/tkachenko0/dotfiles/main/install.sh | bash
```

For a Docker container with Ubunto 24:

```bash
apt update
apt upgrade
apt install curl git

apt-get install sudo
rm -rf /var/lib/apt/lists/*

useradd -m viacheslav
passwd viacheslav
usermod -aG sudo viacheslav
su - viacheslav
```
