
# aliases
alias l='l -CF'
alias ll='ls -lhF'
alias lll='ls -ltrFh'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' 
alias charm='chmod +x'
alias h='history'
alias scp='scp -p'
# alias top='top -ocpu -O+rsize -s 5 -n 50'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1='\u@\h:\w\$ '
# export PROMPT_COMMAND='echo -ne "\\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\\007"'

export EDITOR='/usr/bin/vi'
export HISTCONTROL=ignoredups # Ignores dupes in the history
export HISTCONTROL=ignoreboth:erasedups # remove dupes from fzf_history
HISTFILESIZE=100000000
HISTSIZE=100000

umask 002 # default file permissions: all read, owner and group write

# added by Anaconda3 5.1.0 installer
# export PATH="/Users/Alex/anaconda3/bin:$PATH"
# eval "$(register-python-argcomplete conda)"

# WSL default dir is /mnt/c/Users/username
cd /home/alex
source ~/.bashrc
