FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y

RUN mkdir -p ~/dev/personal ~/.config

# Core
RUN apt install -y make build-essential procps curl libssl-dev zlib1g-dev fzf gcc

#Git (ensure the latest git is installed to make neovim Diffview plugin work)
RUN apt install -y git 

RUN git clone --recurse-submodules git@github.com:tkachenko0/dotfiles.git ~/dev/personal/dotfiles

RUN git config --global user.name "viacheslav.tkachenko"
RUN git config --global user.email "t.viacheslav00@gmail.com"
RUN git config --global init.defaultBranch main
RUN git config --global core.editor "nvim"

# Zsh
RUN apt install -y zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN chsh -s "$(which zsh)"
SHELL ["/usr/bin/zsh", "-c"]
# Zsh Plugins
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh Configuration
RUN rm ~/.zshrc
RUN ln -s ~/dev/personal/dotfiles/.zshrc ~/.zshrc
RUN source ~/.zshrc

# Homebrew
RUN NONINTERACTIVE=1 \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN source ~/.zshrc

# Delta (diff viewer)
RUN source ~/.zshrc && brew install git-delta
RUN git config --global core.pager "delta"
RUN git config --global interactive.diffFilter "delta --color-only"
RUN git config --global delta.navigate true
RUN git config --global delta.side-by-side true
RUN git config --global delta.syntax-theme "Visual Studio Dark+"
RUN git config --global delta.hunk-header-style omit
RUN git config --global delta.dark true

## Scripts
RUN ln -s ~/dev/personal/dotfiles/usr/local/bin/tmux-sessionizer /usr/local/bin/tmux-sessionizer
RUN ln -s ~/dev/personal/dotfiles/usr/local/bin/git-pullmaster /usr/local/bin/git-pullmaster
RUN ln -s ~/dev/personal/dotfiles/usr/local/bin/kickass /usr/local/bin/kickass
RUN ln -s ~/dev/personal/dotfiles/usr/local/bin/git-branch-switcher /usr/local/bin/git-branch-switcher
RUN ln -s ~/dev/personal/dotfiles/usr/local/bin/git-stash-lister /usr/local/bin/git-stash-lister
RUN ln -s ~/dev/personal/dotfiles/usr/local/bin/git-multiproj-branch-switcher /usr/local/bin/git-multiproj-branch-switcher

RUN chmod +x /usr/local/bin/tmux-sessionizer
RUN chmod +x /usr/local/bin/git-pullmaster
RUN chmod +x /usr/local/bin/kickass
RUN chmod +x /usr/local/bin/git-branch-switcher
RUN chmod +x /usr/local/bin/git-stash-lister
RUN chmod +x /usr/local/bin/git-multiproj-branch-switcher

# Tmux
RUN apt -y install tmux
RUN ln -s ~/dev/personal/dotfiles/.tmux.conf ~/.tmux.conf

# Node.js and npm and nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
RUN source ~/.zshrc && nvm install --lts

# Python and pyenv
RUN curl -fsSL https://pyenv.run | bash
RUN source ~/.zshrc && pyenv install 3.12.3
RUN source ~/.zshrc && pyenv global 3.12.3

# Neovim
RUN apt install -y ripgrep
RUN apt install -y luarocks
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
RUN rm -rf /opt/nvim
RUN tar -C /opt -xzf nvim-linux-x86_64.tar.gz
RUN ln -s ~/dev/personal/dotfiles/nvim ~/.config/nvim

CMD ["zsh"]
