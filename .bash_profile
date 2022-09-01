
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1='\u@\h:\w\$ '
# export PROMPT_COMMAND='echo -ne "\\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\\007"'

export EDITOR='/usr/bin/vi'

umask 002 # default file permissions: all read, owner and group write

source ~/.bashrc
