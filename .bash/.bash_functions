# vim: set ft=sh:

# cd and list
cdl() { cd "$*" && ls --color=auto -lh; }

# Convert hex to decimal and vice versa
htd() { printf "%d\n" "$1";   }
dth() { printf "0x%x\n" "$1"; }

# Make easy some common commands
findd()   { find . -iname "*$1*" | grep --color=auto -i "$1"; }
list()    { dpkg -l | grep --color=auto -i "$1"; }
pss()     { ps aux | grep --color=auto -i "$1"; }
install() { sudo apt-get install "$@"; }
remove()  { sudo apt-get remove "$@"; }
update()  { sudo apt-get update; }
upgrade() { sudo apt-get upgrade; }
policy()  { apt-cache policy "$@"; }
show()    { apt-cache show "$@"; }
search()  { apt-cache search "$@" | grep --color=auto -i "$1"; }
pips()    { pip search "*$1*" | grep --color=auto -i "$1"; }
freeze()  { pip freeze | grep --color=auto -i "$1"; }

# Open file in specific vim server
vimr() { vim --servername "$1" --remote "${@:2}"; }

# Make a directory and cd to it
mkcd() {
  if [ $# -ne 1 ]; then
    echo "Usage: mkcd <dir>"
    return 1
  else
    mkdir -p $1 && cd $1
  fi
}

# Extract pages from a pdf file
pdfpextr() {
  # this function uses 3 arguments:
  #     $1 is the first page of the range to extract
  #     $2 is the last page of the range to extract
  #     $3 is the input file
  #     output file will be named "inputfile_pXX-pYY.pdf"
  gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
     -dFirstPage=${1} \
     -dLastPage=${2} \
     -sOutputFile=${3%.pdf}_p${1}-p${2}.pdf \
     ${3}
}

# [Re-Env] Activate current project's virtualenv
# https://github.com/buchuki/re-env/blob/master/re-env.sh
function v {
  # activate a virtualenv
  # usage: v
  #   activate the virtualenv named venv
  # usage: v venvname
  #   activate the virtualenv named venvname
  name=venv
  if [ $1 ] ; then
    name=$1
  fi
  olddir=$(pwd)
  quit=0
  deactivate &>/dev/null
  cwd=$(pwd)
  while [ $quit -eq 0 ]
  do
    cd $cwd
    if [ $cwd == '/' ] ; then
      quit=1
    fi
    if [ -e $name ]  ; then
      source "$name/bin/activate"
      quit=1
    fi
    cwd=$(readlink -f $(dirname $cwd))
  done
  cd $olddir
}
