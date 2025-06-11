FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get upgrade -y 

RUN mkdir -p /root/dev/personal 
RUN mkdir -p /root/.config 

RUN apt install -y git

RUN git clone https://github.com/tkachenko0/dotfiles.git /root/dev/personal/dotfiles 
RUN git clone https://github.com/tkachenko0/nvim.git /root/.config/nvim 

RUN chmod +x /root/dev/personal/dotfiles/install.sh 
RUN /root/dev/personal/dotfiles/install.sh 

CMD ["zsh"]
