## aliases
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
alias dfh='df -h -x"squashfs"'
alias matlab='matlab -nodesktop -nosplash'
# alias top='top -ocpu -O+rsize -s 5 -n 50'
# alias addkey='eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa'
# TODO test --apple-use-keychain (to enable after restart)
alias addkey='eval `ssh-agent -s` && ssh-add --apple-use-keychain ~/.ssh/id_rsa'


alias sshix='ssh -YC $GREEN_USERNAME@$GREEN_IP'
# alias sshtunnel='screen ssh -L 8080:localhost:8080 dolbyix@$DESKTOP_IP'
alias sshtunnel8080='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 8080:localhost:8080 $GREEN_USERNAME@$GREEN_IP'
alias sshtunnel7007='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7007:localhost:7007 $GREEN_USERNAME@$GREEN_IP'

function mkdircd(){
    mkdir -p $1
    cd $1
}
function search_configs(){
    for DIR in `ls -I "*.*" .`; do
        echo $DIR;
        cat $DIR/*.ini | grep -i "$1";
    done
}
function lib_installed() {
    /sbin/ldconfig -N -v $(sed 's/:/ /' <<< $LD_LIBRARY_PATH) 2>/dev/null | grep $1;
}
function check() {
    lib_installed $1 && echo "$1 is installed" || echo "ERROR: $1 is NOT installed";
}
 
## Ubuntu aliases
# alias mntgdrive='google-drive-ocamlfuse ~/googledrive-drive-ocamlfuse ~/googledrive'
# alias umntgdrive='fusermount -u ~/googledrive'
alias juplaunch='screen jupyter lab --no-browser --notebook-dir ~/software/notebooks_acq/ --port 8080'
alias mount_btc='sudo mount -t cifs -o username=dolbyix //bills-trash-can.dsv.eng.dolby.net/ix_data_60 /mnt/bills-trash-can/ix_data_60'
