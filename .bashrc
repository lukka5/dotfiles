# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

############################### Settings ##################################

# Decide wich terminal to use and launch tmux
if [ -e /usr/share/terminfo/g/gnome-256color ]; then
  export TERM='gnome-256color'
else
  export TERM='xterm-16color'
fi

# If we have tmux start replacing bash with it
if which tmux 2>&1 >/dev/null && test -z "$TMUX"; then
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


# Identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi


################################# Prompt ##################################

if [[ -f ~/.bash_prompt ]]; then
  source ~/.bash_prompt
else
  PS1='${debian_chroot:+(debian_chroot)}[\u@\h \w]\$ '
fi


############################### Functions #################################

# cd into dir of located file :D
function ct { cd `locate "$1" | head -n 1 | xargs dirname`; }

# calculate an expresion (i.e. calc 1+1)
function calc { echo "$@"|bc -l; }

# Convert hex to decimal
function htd { printf "%d\n" "$1";   }
function dth { printf "0x%x\n" "$1"; }

# Make easy some common search commands
function findd   { find . -iname "*$1*";                           }
function list    { dpkg -l | grep "$1";                            }
function pss     { ps aux | grep "$1";                             }
function install { sudo apt-get install "$@";                      }
function update  { sudo apt-get update;                            }
function upgrade { sudo apt-get upgrade;                           }
function search  { apt-cache search "$@" | grep --color=auto "$1"; }
function policy  { apt-cache policy "$@";                          }

# Make a directory and change to it
function mkcd {
  if [ $# -ne 1 ]; then
    echo "Usage: mkcd <dir>"
    return 1
  else
    mkdir -p $1 && cd $1
  fi
}


################################ Aliases ##################################

# Use a separate file for all the aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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
fi


# vim: set sts=2 sw=2 et:
