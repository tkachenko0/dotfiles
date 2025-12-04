FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# Install git and sudo first
RUN apt-get update && apt-get install -y git sudo

# Create non-root user
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

RUN mkdir -p ~/dev/personal ~/.config

COPY . ~/dev/personal/dotfiles
RUN git clone https://github.com/tkachenko0/nvim.git ~/dev/personal/nvim

WORKDIR ~/dev/personal/dotfiles
RUN ./install.sh all

CMD ["zsh"]
