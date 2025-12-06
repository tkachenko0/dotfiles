FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y git sudo

# Create non-root user
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

RUN mkdir -p ~/dev/personal ~/.config

COPY . /home/testuser/dev/personal/dotfiles

WORKDIR /home/testuser/dev/personal/dotfiles

RUN ./install.sh core
RUN ./install.sh git 
RUN ./install.sh zsh
RUN source ~/.zshrc && ./install.sh homebrew
RUN source ~/.zshrc && ./install.sh delta
RUN source ~/.zshrc && ./install.sh starship
RUN source ~/.zshrc && ./install.sh tmux
RUN source ~/.zshrc && ./install.sh nvm
RUN source ~/.zshrc && ./install.sh pyenv
RUN source ~/.zshrc && ./install.sh neovim
RUN source ~/.zshrc && ./install.sh scripts

CMD ["zsh"]
