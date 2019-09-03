# Manual paths.
LOCALSBIN="/usr/local/sbin"
SCALAPATH="/usr/local/Cellar/scala@2.11/2.11.11/bin"
[[ -d $LOCALSBIN ]] && [[ ":$PATH:" != *":$LOCALSBIN:"* ]] && PATH="$LOCALSBIN:${PATH}"
[[ -d $SCALAPATH ]] && [[ ":$PATH:" != *":$SCALAPATH:"* ]] && PATH="$SCALAPATH:${PATH}"

export HOMEBREW_GITHUB_API_TOKEN=c4d628d41bb90aa8cdc3783dbdf31c05635c45f6
export EDITOR='vim'

# Fixes python3 locale.getlocale() (Used by pipenv and maybe others)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000
shopt -s histappend  # Append to the history file, don't overwrite it
export HISTCONTROL=ignoreboth:erasedups  # No duplicates in history

# Colored man pages (http://en.wikipedia.org/wiki/ANSI_escape_code)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

if which tmux > /dev/null && test -z "$TMUX"; then
  tmux new -d -s default
  exec tmux attach -t default
fi

if which brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bash/aliases ]; then . ~/.bash/aliases; fi
if [ -f ~/.bash/functions ]; then . ~/.bash/functions; fi
if [ -f ~/.bash/prompt ]; then . ~/.bash/prompt; fi
if [ -d ~/.bash/extra ]; then
  for f in ~/.bash/extra/!(*.md); do . $f; done
fi

# FZF
if [ -f ~/.fzf.bash ]; then . ~/.fzf.bash; fi
export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# Anaconda
# Instead of doing export PATH=/usr/local/anaconda3/bin:"$PATH" and
# messing the system and brew pythons I use a custom functions
# (see ~/.bash/.bash_functions) `conda` and `source`.
