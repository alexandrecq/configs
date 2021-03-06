# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# # Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

# aliases
alias l='l -CF'
alias ll='ls -lhF'
alias lll='ls -ltrFh'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' 
alias charm='chmod +x'
alias h='history'
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update && sudo apt-get upgrade'
alias wnvidia-smi='watch -d -n 0.5 nvidia-smi'
alias dus='du -hd 1 | sort -hr'

alias vsui='source activate vsui'
# alias wv='workon venv_enc'
alias socat='source ~/catkin_ws/devel/setup.bash'

 
# Ubuntu workstation aliases
alias mntgdrive='google-drive-ocamlfuse ~/googledrive-drive-ocamlfuse ~/googledrive'
alias umntgdrive='fusermount -u ~/googledrive'

export GOPATH="$HOME/.gopath"

# system path
# export VIRTUALENVWRAPPER_PYTHON=~/anaconda3/bin/python3
# export WORKON_HOME=~/.venvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export PATH="/home/alex/.local/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
# export PATH="/home/alex/repos/PyMesh/third_party/build/draco/:$PATH"
export PATH="/home/alex/repos/draco/build:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# shared library path
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH="/usr/local/lib/opencvlib:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH="/home/alex/anaconda3/envs/localexp/lib/:$LD_LIBRARY_PATH"

# setup ROS-kinetic env variables
# source /opt/ros/kinetic/setup.bash

# python path
export PYTHONPATH="/home/alex/software:$PYTHONPATH"
export PYTHONPATH="/home/alex/software/v_suite:$PYTHONPATH"
export PYTHONPATH="/home/alex/software/v_suite/v_scripts:$PYTHONPATH"
export PYTHONPATH="/home/alex/software/v_suite/v_suite/v_experiments:$PYTHONPATH"
export PYTHONPATH="/home/alex/repos/pyfusion:$PYTHONPATH"
export PYTHONPATH="/home/alex/repos/netdef_slim:$PYTHONPATH"
export PYTHONPATH="/home/alex/repos/lmbspecialops/python:$PYTHONPATH"
# export PYTHONPATH="/home/alex/repos/S2Dnet/:$PYTHONPATH"
# export PYTHONPATH="/home/alex/anaconda3/lib/python3.5/site-packages:$PYTHONPATH"

# Setting for the UTF-8 terminal support (fix for Perl warning in Ack)
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/

# added by ~/.fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# bind '^F' fzf-completion
test -f ~/.git-completion.bash && . $_

kernel_release=$(uname -r)
if [[ $kernel_release = *Microsoft* ]]; then
    source ~/.wsl_config.sh
fi

. /home/alex/torch/install/bin/torch-activate

# export PATH="/home/alex/anaconda3/bin:$PATH"  # commented out by conda initialize
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/alex/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/alex/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/alex/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alex/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
