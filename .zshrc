# Completions (see https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh)
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
