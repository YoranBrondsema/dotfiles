# Homebrew completions (see https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Aliases
# ls aliases
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hgrep='history | grep'
# ruby
alias rc='rubocop --auto-correct'
# Neovim
alias vim="nvim"

# For tmuxinator (https://github.com/tmuxinator/tmuxinator#editor-and-shell)
export EDITOR='vim'

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
# search fzf and open in Vim
alias fvim='vim $(fzf)'

# asdf
. /usr/local/opt/asdf/asdf.sh

# Customize the prompt
PROMPT='%F{blue}%~%f $ '

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# For Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yoran/Programs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yoran/Programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yoran/Programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yoran/Programs/google-cloud-sdk/completion.zsh.inc'; fi

# Allow [ or ] wherever you want in Rake tasks
unsetopt nomatch

# Ngrok
export PATH="$PATH:$HOME/Programs/ngrok"

# Vim-style editing of commands
bindkey -v

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

# Prettifies a JSON file.
function prettify-json {
  readonly port=${1:?"The path to the JSON file should be set."}
  cat $1 | jq '.' > output.json
  mv output.json $1
}

# Installed node@14 through Homebrew
export PATH="/usr/local/opt/node@14/bin:$PATH"

# SCIP linear programming
export PATH="/Users/yoran/Programs/scipoptsuite-7.0.2/build/bin:$PATH"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
