# ACQ's .bash_profile
# March 2018

echo -ne "Today is "; date
cd /home/alex
# export PRINTER=ColorLaserJet
# export PYTHONSTARTUP="$HOME/.pythonrc"

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

# PATH="${PATH}":/usr/local/bin:/usr/bin:/bin:/sbin
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1='\u@\h:\w\$ '
# export PROMPT_COMMAND='echo -ne "\\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\\007"'

export EDITOR='/usr/bin/vi'
# set -o vi # vi mode for bash commands (insert, etc)
export HISTCONTROL=ignoredups # Ignores dupes in the history
export HISTCONTROL=ignoreboth:erasedups # remove dupes from fzf_history
HISTFILESIZE=100000000
HISTSIZE=100000

# bash completion settings
bind "set completion-ignore-case on" # or set in .inputrc
# bind "set bell-style none" # also disables visual bell
bind "set show-all-if-ambiguous On" #show completion without double tabbin

umask 002 # default file permissions: all read, owner and group write

# Directory shortcuts ----------------------------------------------------
# alias acq='cd /Volumes/data1/Alex/' # or use save '', show (~/.dirs):
if [ ! -f ~/.dirs ]; then #if doesn't exist, create it
    touch ~/.dirs
fi
alias show='cat ~/.dirs'
save (){
    command sed "/!$/d" ~/.dirs > ~/.dirs1; mv ~/.dirs1 ~/.dirs; echo "$@"="`pwd`" >> ~/.dirs; source ~/.dirs ;
}
source ~/.dirs # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility
# Directory shortcuts ----------------------------------------------------

#if [ -f /etc/bashrc ]; then
#  . /etc/bashrc
#fi

# added by Anaconda3 5.1.0 installer
# export PATH="/Users/Alex/anaconda3/bin:$PATH"
# eval "$(register-python-argcomplete conda)"

source ~/.bashrc
