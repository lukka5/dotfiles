# Silence MacOS Catalina warning about new default zsh shell.
export BASH_SILENCE_DEPRECATION_WARNING=1

export EDITOR=nvim
export PYTHONBREAKPOINT=ipdb.set_trace
bind 'set enable-bracketed-paste off'

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

# brew
eval $(/opt/homebrew/bin/brew shellenv)
if which brew > /dev/null && [ -f $(brew --prefix)/completions/bash/brew ]; then
  . $(brew --prefix)/completions/bash/brew
fi

# fzf
eval "$(fzf --bash)"
export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/shims:$PATH"
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv virtualenvwrapper_lazy
fi

# virtualenvwrapper
export PROJECT_HOME=$HOME/projects
export WORKON_HOME=$HOME/.virtualenvs

# pipx
export PATH="$PATH:~/.local/bin"

# tmux
if test -z "$TMUX"; then
  tmux new-session -d -s default
  exec tmux attach-session -t default
fi

if [ -f ~/.bash/aliases ]; then . ~/.bash/aliases; fi
if [ -f ~/.bash/functions ]; then . ~/.bash/functions; fi
if [ -f ~/.bash/prompt ]; then . ~/.bash/prompt; fi
if [ -f ~/.bash_local ]; then
  source ~/.bash_local
fi
