
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1='\u@\h:\w\$ '
# export PROMPT_COMMAND='echo -ne "\\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\\007"'

export EDITOR='/usr/bin/vi'

umask 002 # default file permissions: all read, owner and group write

source ~/.bashrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
