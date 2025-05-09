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
# TODO test --apple-use-keychain (to enable after restart)
# alias addkey='eval `ssh-agent -s` && ssh-add --apple-use-keychain ~/.ssh/id_rsa'
alias vi='vim'
alias nv='nvim'
alias kssh='kitten ssh'

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
# kill processes of open files in a directory (to avoid 'device or resource busy' nfs error)
function killopen() {
    find "$1" -mindepth 1 -maxdepth 1 -print0 | while IFS= read -r -d '' file; do
        echo "$file"
        lsof -t "$file" 2>/dev/null | xargs -r kill
    done
}
 
## Ubuntu aliases
# alias mntgdrive='google-drive-ocamlfuse ~/googledrive-drive-ocamlfuse ~/googledrive'
# alias umntgdrive='fusermount -u ~/googledrive'
# alias mount_btc='sudo mount -t cifs -o username=dolbyix //bills-trash-can.dsv.eng.dolby.net/ix_data_60 /mnt/bills-trash-can/ix_data_60'
alias juplaunch='screen -dmS jup jupyter lab --no-browser --notebook-dir ~/software/notebooks_acq/ --port 8080'
function launch_tensorboard(){
    screen -dmS tb_screen tensorboard --host localhost --port 7008 --logdir="$1"
}


# Remote aliases/functions
alias sshix='ssh -YC $GREEN_USERNAME@$GREEN_IP'
# alias sshtunnel='screen ssh -L 8080:localhost:8080 dolbyix@$DESKTOP_IP'
# alias sshtunnel8080='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 8080:localhost:8080 $GREEN_USERNAME@$GREEN_IP'
# alias sshtunnel7007='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7007:localhost:7007 $GREEN_USERNAME@$GREEN_IP'
sshtunnel7007() {
    local var_name="A100$1"
    eval host_name=\$$var_name
    screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7007:localhost:7007 adech@$host_name
}
alias sshtunnel7008='screen autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 7008:localhost:7008 adech@$A1001'
alias sync_outputs='rsync -avz --include="*jpg" --include="*/" --exclude="*" adech@$A1001:///home/adech/repos/dolby-nerfstudio/outputs ~/dolby/data/nerfstudio_outputs'

# Function to synchronize repos between two machines
sync_repo() {
  local direction=$(echo "$1" | xargs)  # Trims whitespace
  local repo_name=$(echo "$2" | xargs)  # Trims whitespace

  # Define the local and remote paths
  local local_path="$HOME/repos/"
  local remote_path="adech@$MB_LOCAL:/Users/adech/repos/"

  # Debug: Print the paths to verify
  echo "Local path: '$local_path'"
  echo "Remote path: '$remote_path'"

  # Check the direction and perform the appropriate rsync command
  if [[ "$direction" == "l2r" ]]; then
    echo "Syncing from local to remote..."
    rsync -avz --delete "$local_path/$repo_name" "$remote_path"
  elif [[ "$direction" == "r2l" ]]; then
    echo "Syncing from remote to local..."
    rsync -avz --delete "$remote_path/$repo_name" "$local_path"
  else
    echo "Invalid direction. Use 'l2r' or 'r2l'."
  fi
}
