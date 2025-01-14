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
   && rm -rf /var/lib/apt/lists/*

# Installing oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch

# Setting zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source /zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Setting powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Setting zsh as default terminal
chsh -s $(which zsh)