# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Enable aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Prompt
PS1='[\u@\h \W]\$ '

# Environment variables
export BROWSER=/usr/bin/google-chrome-stable
export EDITOR="vim"
export GPG_TTY=$(tty)

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF (Search)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Rust (Cargo)
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
