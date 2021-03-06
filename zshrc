#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source base16 256 colourspace script.
if [[ -s "$HOME/.config/base16-shell/scripts/base16-material.sh" ]]; then
  source "$HOME/.config/base16-shell/scripts/base16-material.sh"
fi

# Aliases
alias g="git"
alias gclean="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"
alias m="tmuxinator"
alias t="tmux"
alias a="tmux attach -t"

. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

eval "$(direnv hook zsh)"
export PATH="/usr/local/sbin:$PATH"
export NODEJS_CHECK_SIGNATURES="no"
export GOPATH="~/Code/go"
