# WSL specific configuration

# aliases
alias cprd='cp -vi -- "$(ls -rtd ~/winhome/Downloads/** | tail -n1)" '
alias addkey='eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa'
alias findwsl='sudo find / -not \( -path /mnt/c -prune \)'
mountwsl() {
    sudo mount -t drvfs $1: /mnt/$1
}
# alias cprf='cp -vi -- "$(ls -rtd .* | tail -n1)" ~/winhome/Downloads/'
cprf() {
        cp -vi -- "$(ls -rtd "$1" | tail -n1)" ~/winhome/Downloads/
    }

export DISPLAY=:0
export DISPLAY=localhost:0.0
# export NO_AT_BRIDGE=1   # X apps "Couldn't connect to accessibility bus"
