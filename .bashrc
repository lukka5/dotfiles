### ~/.bashrc


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Decide wich terminal to use
if [ -e /usr/share/terminfo/g/gnome-256color ]; then
        export TERM='gnome-256color'
else
        export TERM='xterm-16color'
fi

# Disable annoying gnome-keyring
unset GNOME_KEYRING_CONTROL

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Custom prompt (fedora like)
PS1='${debian_chroot:+($debian_chroot)}\u@\h (\w): '

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
                         || eval "$(dircolors -b)"
fi


### Functions

# cd into dir of located file :D
function ct { cd `locate "$1" | head -n 1 | xargs dirname`; }

# convert hex to decimal
function htd { printf "%d\n" "$1";   }
function dth { printf "0x%x\n" "$1"; }

# make easy some common search commands
function findd  { find . -iname "*$1*";  }
function search { apt-cache search "$1" | grep --color=auto "$1"; }
function policy { apt-cache policy "$1"; }


### Alias definitions

# Use a separate file for all the aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


### Completion

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# vim: set sts=2 sw=2 et:
