#!/usr/bin/env bash

# Install dependecies
apt-get update && apt-get install -y --no-install-recommends \
   python3-launchpadlib \
   vim \
   wget \
   curl \
   zsh \
   git \
   openssh-server \
   jq \
   ruby-full \
   build-essential \
   apt-utils \
   locales \
   fzf \
   && rm -rf /var/lib/apt/lists/*

# Installing oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch

# Setting zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source /zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Setting zsh as default terminal
chsh -s $(which zsh)

# !Installing colorls
# * Required locales
gem install colorls
echo "alias ls='colorls -lA --sd'" >> ${ZDOTDIR:-$HOME}/.zshrc 
locale-gen en_US.UTF-8

# TODO
# ! Check why it install old fzf version 
# ? Check if to install using git clone
# echo eval "$(fzf --zsh)" >> ${ZDOTDIR:-$HOME}/.zshrc 