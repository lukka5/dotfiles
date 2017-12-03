# vim: set ft=sh:

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls -lh --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
fi

alias l='ls -lh'
alias la='ls -A'
alias lla='l -A'
alias t='tree'
alias ..='cd ..'
alias k='kill'
alias d='deactivate 2> /dev/null || source deactivate'  # venv

alias dfh='df -h'
alias duh='du -sh'
alias freeh='free -h'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias vim='vim --servername VIM'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias vim='vim'
fi
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias profile='vim ~/.bash_profile'
alias tmuxconf='vim ~/.tmux.conf'
alias prompt='vim ~/.bash/.bash_prompt'
alias aliases='vim ~/.bash/.bash_aliases'
alias functions='vim ~/.bash/.bash_functions'
alias extraconf='vim ~/.bash/.bash_extra_local_conf'

alias more='less'
alias so='source ~/.bash_profile'
alias grep='grep --color=auto'
alias ppath="echo $PATH | tr -s ':' '\n'"

if [[ $(which colordiff) ]]; then
    alias diff='colordiff'
fi

alias valgrind='valgrind --leak-check=full --show-reachable=yes'
alias famaf='ssh ldg0112@mail.famaf.unc.edu.ar'

# Python
alias ppjson="python -m json.tool"  # Pretty print json (i.e. $ echo '{"foo": "bar"}' | ppjson).
alias pymodule="python -c 'from imp import find_module;from sys import argv;print(find_module(argv[1])[1])'"  # Find path to python module.
alias pydoc="python -m pydoc"  # Show doc entry for python keyword.
alias clean_pycs="find . -name '*.pyc' -exec rm '{}' ';'"
alias cookiedjango="cookiecutter https://github.com/pydanny/cookiecutter-django"
alias pshell="pipenv shell"
