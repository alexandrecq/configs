## aliases
alias l='l -CF'
alias ll='ls -lhF'
alias lr='ls -ltrFh'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias f='find . -iname'
alias dus='du -hd 1 | sort -hr'
alias ducks='du -cks * | sort -rn | head -11' 
alias charm='chmod +x'
alias h='history'
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update && sudo apt-get upgrade'
alias wnvidia-smi='watch -d -n 0.5 nvidia-smi'
alias dfh='df -h -x"squashfs"'
alias matlab='matlab -nodesktop -nosplash'
# alias top='top -ocpu -O+rsize -s 5 -n 50'
alias addkey='eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa'
# # TODO test --apple-use-keychain (to enable after restart)
# alias addkey='eval `ssh-agent -s` && ssh-add --apple-use-keychain ~/.ssh/id_rsa'
alias vi='nvim'
alias nv='nvim'
alias kssh='kitten ssh'

alias sshix='ssh -YC $GREEN_USERNAME@$GREEN_IP'
# alias sshtunnel='screen ssh -L 8080:localhost:8080 dolbyix@$DESKTOP_IP'
# alias sshtunnel8080='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 8080:localhost:8080 $GREEN_USERNAME@$GREEN_IP'
# alias sshtunnel7007='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7007:localhost:7007 $GREEN_USERNAME@$GREEN_IP'
# 3d viewer on A100-x
sshtunnel7007() {
    local var_name="A100$1"
    eval host_name=\$$var_name
    screen -dmS sshtunnel7007 autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7007:localhost:7007 adech@$host_name
}
# tensorboard on A100-6
alias sshtunnel7008='screen -dmS tensorboard7008tunnelA1006 autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7008:localhost:7008 adech@$A1006'
# jupyterlab on A100-6
alias sshtunnel8080='screen -dmS jupyterlab8080tunnelA1006 autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 8080:localhost:8080 adech@$A1006'

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
# alias mount_btc='sudo mount -t cifs -o username=dolbyix //bills-trash-can.dsv.eng.dolby.net/ix_data_60 /mnt/bills-trash-can/ix_data_60'
alias juplaunch='screen jupyter lab --no-browser --notebook-dir ~/software/notebooks_acq/ --port 8080'
function launch_tensorboard(){
    screen tensorboard --host localhost --port 7008 --logdir="$1"
}

# alias sync_outputs='rsync -avz --include="*jpg" --include="*/" --exclude="*" adech@$A1001:///home/adech/repos/dolby-nerfstudio/outputs ~/dolby/data/nerfstudio_outputs'
sync_outputs() {
  local extension="${1:-jpg}"  # Use provided extension or default to jpg
  local source_path="adech@$A1001:/home/adech/repos/dolby-nerfstudio/outputs/"
  local dest_path="$HOME/dolby/data/nerfstudio_outputs/"
  rsync -avz --include="*/" --include="*.${extension}" --exclude="*" "${source_path}" "${dest_path}"
}
alias sync_gsplat_results='rsync -arv --delete --include="*/" --exclude="*.pt" adech@$A1005:/home/adech/repos/gsplat/results/ ~/dolby/data/gsplat_results/'

# # hard-coded src/dest dirs
# alias launch_sync_session="screen -dmS sync_session bash -c 'fswatch -r ~/repos/NoPoSplat | while read -r file; do rsync -avz ~/repos/NoPoSplat adech@$A1001:/home/adech/repos/; done'"
# # dynamic version - launch as `launch_sync_session /path/to/source user@remote_host:/path/to/destination`
# alias launch_sync_session="function _start_sync() { screen -dmS sync_session_$1 bash -c \"fswatch -r \$1 | while read -r file; do rsync -avz \$1/ \$2; done\"; }; _start_sync"
# dynamic version - launch as `launch_sync_session repo_name`
alias launch_sync_session="function _start_sync() { screen -dmS sync_session_\$1 bash -c \"fswatch -r ~/repos/\$1 | while read -r file; do rsync -avz ~/repos/\$1 adech@$A1005:~/repos/; done\"; }; _start_sync"
# launch_sync_session ~/repos/NoPoSplat adech@$A1005:~/repos/NoPoSplat
