source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

export CLICOLOR=1

export GREP_OPTIONS='--color=auto'

function parse_git_rep {
  git remote -v 2> /dev/null | \
    sed -e '/fetch)$/!d' | \
    grep "[a-zA-Z0-9_-]*/[a-zA-Z0-9_-]*\.git" -o --color=never | \
    sed -e 's/.git/ /'
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | \
    sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}

function proml {
  local        BLACK="\[\033[0;30m\]"
  local    DARK_GRAY="\[\033[1;30m\]"
  local         BLUE="\[\033[0;34m\]"
  local   LIGHT_BLUE="\[\033[1;34m\]"
  local        GREEN="\[\033[0;32m\]"
  local  LIGHT_GREEN="\[\033[1;32m\]"
  local         CYAN="\[\033[0;36m\]"
  local   LIGHT_CYAN="\[\033[1;36m\]"
  local          RED="\[\033[0;31m\]"
  local    LIGHT_RED="\[\033[1;31m\]"
  local       PURPLE="\[\033[0;35m\]"
  local LIGHT_PURPLE="\[\033[1;35m\]"
  local  LIGHT_GREEN="\[\033[1;32m\]"
  local        BROWN="\[\033[0;33m\]"
  local       YELLOW="\[\033[1;33m\]"
  local   LIGHT_GRAY="\[\033[0;37m\]"
  local        WHITE="\[\033[1;37m\]"
  case $TERM in
    xterm*)
      local TITLEBAR='\[\033]0;\u@\h:\w\007\]' 
      ;; 
    *) 
      local TITLEBAR="" 
      ;;
  esac
  #\u@\h:
  #export PS1="$LIGHT_GREEN\$(parse_git_rep)$SYMBOL_TREE$YELLOW\$(parse_git_branch)$LIGHT_BLUE\W $LIGHT_RED$ $LIGHT_GRAY"
  local REPOSITORY="$LIGHT_GREEN\$(parse_git_rep)"
  local BRANCH="$YELLOW\$(parse_git_branch)"
  local PROMPT="$LIGHT_RED$ $LIGHT_GRAY"
  #export PS1="$REPOSITORY$BRANCH$PROMPT"
  export PS1="$REPOSITORY$BRANCH$LIGHT_BLUE\W $PROMPT"
  PS2='> '
  PS4='+ '
}
proml

set -o vi

