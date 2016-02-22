# cd into dir of located file
cdl() { cd "$*" && ls --color=auto -l; }
ct() { cd `locate "$1" | head -n 1 | xargs dirname`; }

# mini img
coverimg() { convert "$1" -resize 200x200 small.jpg; }

# ls full path
lsp() { ls -d -1 $PWD/*; }

# Calculate an expresion (i.e. calc 1+1)
calc() { echo "$@" | bc -l; }

# Convert hex to decimal
htd() { printf "%d\n" "$1";   }
dth() { printf "0x%x\n" "$1"; }

# Make easy some common search and apt commands
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
function vimr() {
    vim --servername "$1" --remote "${@:2}";
}

# Make a directory and change to it
mkcd() {
  if [ $# -ne 1 ]; then
    echo "Usage: mkcd <dir>"
    return 1
  else
    mkdir -p $1 && cd $1
  fi
}

# Extrac pages from a pdf file
pdfpextr()
{
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

# Make gif from ogv
ogv2gif()
{
    echo "Sampling images... "
    mplayer -ao null ${1} -vo jpeg:outdir=ogv2gif_tmp
    echo "Done"
    echo "Making gif... "
    convert ogv2gif_tmp/* out.gif
    echo "Done."
    echo "Optimizing... "
    convert out.gif -fuzz 10% -layers Optimize out-optimized.gif
    rm -rf ogv2gif_tmp
    echo "Done"
    echo "All done!"
}

# Re-Env: https://github.com/buchuki/re-env/blob/master/re-env.sh
# Activate current project's virtualenv
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


# vim: set ft=sh:
