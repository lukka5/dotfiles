# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

############################### Settings ##################################

# Decide wich terminal to use and launch tmux
if [ -e /usr/share/terminfo/s/screen-256color-s ]; then
  export TERM='screen-256color'
elif [ -e /usr/share/terminfo/g/gnome-256color ]; then
  export TERM='gnome-256color'
else
  export TERM='xterm-256color'
fi

# If we have tmux, start it replacing the shell with it
if which tmux > /dev/null && test -z "$TMUX"; then
  tmux new -d -s default
  exec tmux attach -t default
fi

# Disable annoying gnome-keyring
unset GNOME_KEYRING_CONTROL

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Omnetpp
export TCL_LIBRARY=/usr/share/tcltk/tcl8.5
export PATH=$PATH:/home/lucas/code/omnetpp-4.4.1/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/lucas/code/omnetpp-4.4.1/lib

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable color support for ls
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
                       || eval "$(dircolors -b)"
fi

# Colored man pages (http://en.wikipedia.org/wiki/ANSI_escape_code)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'


################################# Prompt ##################################

# Identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# We want a sexy prompt if not possible use a default one
if [[ -f ~/.bash/.bash_prompt ]]; then
  . ~/.bash/.bash_prompt
else
  PS1='${debian_chroot:+(debian_chroot)}[\u@\h \w]\$ '
fi


############################### Functions #################################

if [ -f ~/.bash/.bash_functions ]; then
  . ~/.bash/.bash_functions
fi


################################ Aliases ##################################

if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi


############################### Completion ################################

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

  # Add extra completions.
  if [ -d ~/.bash/.bash_completion.d/ ]; then
    . ~/.bash/.bash_completion.d/*
  fi
fi


# vim: set sts=2 sw=2 et:
