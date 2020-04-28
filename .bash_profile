# Manual paths.
LOCALSBIN="/usr/local/sbin"
SCALAPATH="/usr/local/Cellar/scala@2.11/2.11.11/bin"
[[ -d $LOCALSBIN ]] && [[ ":$PATH:" != *":$LOCALSBIN:"* ]] && PATH="$LOCALSBIN:${PATH}"
[[ -d $SCALAPATH ]] && [[ ":$PATH:" != *":$SCALAPATH:"* ]] && PATH="$SCALAPATH:${PATH}"

# Silence MacOS Catalina warning about new default zsh shell.
export BASH_SILENCE_DEPRECATION_WARNING=1

export EDITOR='vim'
export PYTHONBREAKPOINT=ipdb.set_trace

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

# fzf
if [ -f ~/.fzf.bash ]; then . ~/.fzf.bash; fi
export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# virtualenvwrapper
export PROJECT_HOME=$HOME/projects
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  pyenv virtualenvwrapper_lazy
fi

# pipx
export PATH="$PATH:~/.local/bin"

# tmux
if which tmux > /dev/null && test -z "$TMUX"; then
  tmux new -d -s default
  exec tmux attach -t default
fi

# bash extra
if which brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bash/aliases ]; then . ~/.bash/aliases; fi
if [ -f ~/.bash/functions ]; then . ~/.bash/functions; fi
if [ -f ~/.bash/prompt ]; then . ~/.bash/prompt; fi
if [ -d ~/.bash/extra ]; then
  for f in ~/.bash/extra/!(*.md); do . $f; done
fi
