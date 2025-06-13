FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt install -y git

RUN mkdir -p ~/dev/personal 
RUN mkdir -p ~/.config 

COPY . /root/dev/personal/dotfiles/
# or do a git clone if you prefer

RUN chmod +x ~/dev/personal/dotfiles/bootstrap
RUN ~/dev/personal/dotfiles/bootstrap

CMD ["zsh"]
