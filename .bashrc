#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim
# <<< END ADDED BY CNCHI INSTALLER

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Set vim as default editor
export EDITOR="vim"
export PATH="$PATH:/home/val/.cabal/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PATH="/home/val/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/val/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/val/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/val/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/val/perl5"; export PERL_MM_OPT;
export GPG_TTY=$(tty)

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
