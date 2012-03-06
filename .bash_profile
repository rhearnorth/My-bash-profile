. .git-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
NO_COLOR="\[\033[0m\]"

git_status() {
  if current_git_status=$(git status | grep 'added to commit' 2> /dev/null); then
    echo -e "\033[0;31m‡€"
  fi
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  status_icon=$(git_status)
  echo "["${ref#refs/heads/}"]$status_icon"
}

PS1="\$(rvm-prompt v p g)$GREEN\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:$PATH