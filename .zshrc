# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yoran/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

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
alias rc='rubocop --autocorrect'
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

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

# PostgreSQL
export PATH="/usr/local/Cellar/postgresql@13/13.5_1/bin/:$PATH"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# gitmux (display Git branch in Tmux status)
export PATH="$PATH:$HOME/Programs/gitmux"
