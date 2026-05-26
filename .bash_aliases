## aliases
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
function dfh() {
    if [[ "$(uname)" == "Darwin" ]]; then
        df -h
    else
        df -h -x squashfs
    fi
}
# alias top='top -ocpu -O+rsize -s 5 -n 50'
alias addkey='eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa'
# alias addkey='eval `ssh-agent -s` && ssh-add --apple-use-keychain ~/.ssh/id_rsa'
alias vi='nvim'
alias kssh='kitten ssh'
alias gemini='/google/bin/releases/gemini-cli/tools/gemini'


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
 

alias juplaunch='screen -dmS jup jupyter lab --no-browser --notebook-dir ~/software/notebooks_acq/ --port 8080'
function launch_tensorboard(){
    screen -dmS tb_screen tensorboard --host localhost --port 7008 --logdir="$1"
}

# Function to synchronize repos between two machines
# Usage: sync_repo <l2r|r2l> <repo_name> <remote_path> [local_path]
# Example: sync_repo l2r my_repo user@host:/home/user/repos/
sync_repo() {
  local direction="$1"
  local repo_name="$2"
  local remote_path="$3"
  local local_path="${4:-$HOME/repos/}"

  if [[ -z "$direction" || -z "$repo_name" || -z "$remote_path" ]]; then
    echo "Usage: sync_repo <l2r|r2l> <repo_name> <remote_path> [local_path]"
    return 1
  fi

  if [[ "$direction" == "l2r" ]]; then
    echo "Syncing from local to remote..."
    rsync -avz --delete "$local_path/$repo_name" "$remote_path"
  elif [[ "$direction" == "r2l" ]]; then
    echo "Syncing from remote to local..."
    rsync -avz --delete "$remote_path/$repo_name" "$local_path"
  else
    echo "Invalid direction. Use 'l2r' or 'r2l'."
    return 1
  fi
}

sshtunnel() {
    # syntax:
    #   sshtunnel <ssh_host> [port] [session_name]
    #
    # example:
    #   sshtunnel runpod 8080 jupyter

    local ssh_host="$1"
    local port="${2:-7007}"
    local session_name="$3"

    if [[ -z "$ssh_host" ]]; then
        echo "Usage: sshtunnel <ssh_host> [port] [session_name]"
        return 1
    fi

    # Default session name
    if [[ -z "$session_name" ]]; then
        session_name="sshtunnel-${ssh_host}-${port}"
    fi

    local full_cmd="autossh -M 0 \
        -o ServerAliveInterval=30 \
        -o ServerAliveCountMax=3 \
        -L ${port}:localhost:${port} \
        ${ssh_host}"

    echo "Launching screen session: $session_name"
    screen -dmS "$session_name" bash -c "$full_cmd"
}

launch_sync_session() {
    local input_path="$1"
    local remote="$2"

    if [[ -z "$input_path" || -z "$remote" ]]; then
        echo "Usage: launch_sync_session <path_to_repo> <remote_host>"
        return 1
    fi

    # Expand ~ if present (shell must do this unquoted)
    # Use 'eval' safely here only to expand paths.
    local repo_path
    repo_path=$(eval echo "$input_path")

    # Now repo_path is expanded
    if [[ "$repo_path" != /* ]]; then
        echo "Error: '$input_path' did not resolve to an absolute path"
        return 1
    fi

    # Remove trailing slash then extract repo name
    local trimmed="${repo_path%/}"
    local repo_name="${trimmed##*/}"

    local src="$repo_path"
    local dest="${remote}:/workspace/"
    local session_name="sync_session_${repo_name}"

    if [[ ! -d "$src" ]]; then
        echo "Error: directory '$src' does not exist"
        return 1
    fi

    echo "Starting screen session '$session_name'"
    echo "Watching: $src"
    echo "Syncing to: $dest"

    screen -dmS "$session_name" bash -lc "
        fswatch -r \"$src\" | while read -r file; do
            rsync -avz --no-owner --no-group --no-perms \
                  --exclude='__pycache__/' \
                  \"$src\" \"$dest\"
        done
    "
}

## Ubuntu aliases
# alias mntgdrive='google-drive-ocamlfuse ~/googledrive-drive-ocamlfuse ~/googledrive'
# alias umntgdrive='fusermount -u ~/googledrive'

bt_card() {
  pactl list cards short | awk '/bluez_card/ {print $2; exit}'
}

bt_mic() {
  pactl set-card-profile "$(bt_card)" headset-head-unit
}

bt_hifi() {
  pactl set-card-profile "$(bt_card)" a2dp-sink
}

## G aliases

# Function to check gcert status and run gcert if expiry is within 1 hour
gcert_if_needed() {
  if gcertstatus -nocheck_ssh -check_remaining=1h > /dev/null 2>&1; then
    echo "gcert is valid for at least the next hour."
  else
    echo "gcert is expired or expires soon. Running gcert..."
    gcert
  fi
}

# Connect to a host defined by $DEFAULT_SSH_HOST, ensure gcert on the remote,
# and start/attach to tmx2 session 'work'.
# Usage: ssh_work
ssh_work() {
  # The :? will cause the command to fail and print an error if DEFAULT_SSH_HOST is unset or null.
  local host="${CLOUDTOP_HOST:?Error: CLOUDTOP_HOST environment variable is not set or empty.}"

  # The command to run on the remote machine
  local remote_cmd="gcertstatus -nocheck_ssh -check_remaining=1h || gcert; tmx2 new -A -s work"

  ssh "${host}" -t -- /bin/zsh -c "${remote_cmd}"
}

csv_to_textproto() {
  if [ -z "$1" ]; then
    echo "Usage: csv_to_textproto <input_file.csv>"
    return 1
  fi

  local input_file="$1"
  local output_file="${input_file%.csv}.textproto"

  sed '1d; s/^"//; s/"$//; s/""/"/g' "${input_file}" > "${output_file}"
  echo "Converted ${input_file} to ${output_file}"
}

# If new-session fails, maybe session already exists, so attach it
alias start_colab_kernel='tmux new-session -d -s colab_kernel "blaze run -c opt //experimental/users/alexandrecq/colab:embedding_similarity" || tmux attach-session -t colab_kernel'
alias jetski='/google/bin/releases/jetski-devs/tools/cli'

## End G aliases
