FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN mkdir -p ~/dev/personal ~/.config

COPY . ~/dev/personal/dotfiles
RUN git clone git@github.com:tkachenko0/nvim.git ~/dev/personal/nvim

WORKDIR ~/dev/personal/dotfiles
RUN ./install.sh all

CMD ["zsh"]
