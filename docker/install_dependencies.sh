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
   btop \
   bat \
   unzip \
   fontconfig \
   software-properties-common \
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
echo "alias lc='colorls -lA --sd'" >> ${ZDOTDIR:-$HOME}/.zshrc 
locale-gen en_US.UTF-8

# Set the bindkey options
echo "bindkey '^n' history-search-forward" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "bindkey '^p' history-search-backward" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "bindkey -e" >> ${ZDOTDIR:-$HOME}/.zshrc 

# Set the completion styling
# case sensitive - show upper case results when using lower case
echo "zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"" >> ${ZDOTDIR:-$HOME}/.zshrc 

# Setting the zsh history
echo "HISTSIZE=5000" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "SAVEHIST=$HISTSIZE" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "HISTDUP=erase" >> ${ZDOTDIR:-$HOME}/.zshrc 
echo "setopt appendhistory" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt sharehistory" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt hist_ignore_all_dups" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt hist_save_no_dups" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt hist_ignore_dups" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias c=clear" >> ${ZDOTDIR:-$HOME}/.zshrc





# Adding fastfetch
add-apt-repository -y ppa:zhangsongcui3371/fastfetch
apt-get update 
apt-get install fastfetch
echo "fastfetch" >> ${ZDOTDIR:-$HOME}/.zshrc
