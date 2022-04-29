#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval $(thefuck --alias 'oh')

alias ls='ls --color=auto'

# Enable aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo
source "$HOME/.cargo/env"

# Set default browser and editor
export BROWSER=/usr/bin/google-chrome-stable
export EDITOR="vim"

if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export QT_STYLE_OVERRIDE=gtk
export QT_SELECT=qt5
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

export PATH="$PATH":"$HOME/.pub-cache/bin"

source ~/.cargo/env

PATH="/home/val/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/val/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/val/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/val/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/val/perl5"; export PERL_MM_OPT;
export GPG_TTY=$(tty)
