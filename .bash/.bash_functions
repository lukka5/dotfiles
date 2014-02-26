# cd into dir of located file
ct() { cd `locate "$1" | head -n 1 | xargs dirname`; }

# Calculate an expresion (i.e. calc 1+1)
calc() { echo "$@" | bc -l; }

# Convert hex to decimal
htd() { printf "%d\n" "$1";   }
dth() { printf "0x%x\n" "$1"; }

# Make easy some common search and apt commands
findd()   { find . -iname "*$1*" | --color=auto grep "*$1*"; }
list()    { dpkg -l | grep --color=auto "$1"; }
pss()     { ps aux | --color=auto grep "$1"; }
install() { sudo apt-get install "$@"; }
remove()  { sudo apt-get remove "$@"; }
update()  { sudo apt-get update; }
upgrade() { sudo apt-get upgrade; }
policy()  { apt-cache policy "$@"; }
search()  { apt-cache search "$@" | grep --color=auto "$1"; }

# Make a directory and change to it
mkcd() {
  if [ $# -ne 1 ]; then
    echo "Usage: mkcd <dir>"
    return 1
  else
    mkdir -p $1 && cd $1
  fi
}


# vim: set ft=sh:
