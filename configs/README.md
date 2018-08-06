Based on 
http://www.wangzerui.com/2017/03/06/using-git-to-manage-system-configuration-files/

git clone --no-checkout git@github.com:alexandrecq/configs.git
cd ~/configs
git config core.worktree "../../"
git reset --hard origin/master
