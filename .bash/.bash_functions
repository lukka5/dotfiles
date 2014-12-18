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
search()  { apt-cache search "$@" | grep --color=auto -i "$1"; }

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


# vim: set ft=sh:
