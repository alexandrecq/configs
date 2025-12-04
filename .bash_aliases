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
# alias addkey='eval `ssh-agent -s` && ssh-add --apple-use-keychain ~/.ssh/id_rsa'
alias vi='nvim'
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



### A100 specific aliases ###

# Remote aliases/functions
alias sshix='ssh -YC $GREEN_USERNAME@$GREEN_IP'
sshtunnel() {
    # syntax: sshtunnel 6 7009 name
    local server_idx="$1"
    local port="${2:-7007}"
    local session_name="$3"  # Optional: user-defined session name

    # Extract hostname from the variable name
    local var_name="A100$server_idx"
    eval host_name=\$$var_name

    if [[ -z "$host_name" ]]; then
        echo "Error: Unknown host variable A100$server_idx"
        return 1
    fi

    # If session name not provided, default to sshtunnel-<port>-<host>
    if [[ -z "$session_name" ]]; then
        session_name="sshtunnel-${local_port}-${host_name}"
    fi

    local full_cmd="autossh -M 0 \
    -o \"ServerAliveInterval 30\" \
    -o \"ServerAliveCountMax 3\" \
    -L ${port}:localhost:${port} \
    adech@${host_name}"

    echo "Launching screen session: $session_name"
    screen -dmS "$session_name" bash -c "$full_cmd"
}
# tensorboard on A100-6
alias sshtunnel_tensorboard='sshtunnel 6 7008 tensorboard'
# jupyterlab on A100-6
alias sshtunnel_jupyter='sshtunnel 6 8080 jupyter'

# alias sync_outputs='rsync -avz --include="*jpg" --include="*/" --exclude="*" adech@$A1001:///home/adech/repos/dolby-nerfstudio/outputs ~/dolby/data/nerfstudio_outputs'
sync_outputs() {
  local extension="${1:-jpg}"  # Use provided extension or default to jpg
  local source_path="adech@$A1001:/home/adech/repos/dolby-nerfstudio/outputs/"
  local dest_path="$HOME/dolby/data/nerfstudio_outputs/"
  rsync -avz --include="*/" --include="*.${extension}" --exclude="*" "${source_path}" "${dest_path}"
}
alias sync_gsplat_results='rsync -arv --delete --include="*/" --exclude="*.pt" adech@$A1005:/home/adech/repos/gsplat/results/ ~/dolby/data/gsplat_results/'

# # dynamic version, custom paths - launch as `launch_sync_session /path/to/source user@remote_host:/path/to/destination`
# alias launch_sync_session="function _start_sync() { screen -dmS sync_session_$1 bash -c \"fswatch -r \$1 | while read -r file; do rsync -avz \$1/ \$2; done\"; }; _start_sync"
# dynamic version, ~/repos only - launch as `launch_sync_session repo_name`
alias launch_sync_session="function _start_sync() { screen -dmS sync_session_\$1 bash -c \"fswatch -r ~/repos/\$1 | while read -r file; do rsync -avz ~/repos/\$1 adech@$A1006:~/repos/; done\"; }; _start_sync"
# launch_sync_session ~/repos/NoPoSplat adech@$A1005:~/repos/NoPoSplat
