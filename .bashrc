### RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### NVM
export NVM_DIR="/home/yoran/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### ngrok
export PATH="~/Programs/ngrok:$PATH"

# Remove hostname from terminal (see http://askubuntu.com/a/338505)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
