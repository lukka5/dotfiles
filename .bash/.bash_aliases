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
alias ..='cd ..; l'
alias k='kill'
alias d='deactivate'  # venv

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
alias tmuxconf='vim ~/.tmux.conf'
alias prompt='vim ~/.bash/.bash_prompt'
alias aliases='vim ~/.bash/.bash_aliases'
alias functions='vim ~/.bash/.bash_functions'

alias more='less'
alias so='source ~/.bashrc'
alias grep='grep --color=auto'
alias shell='v; python manage.py shell_plus'

if [[ $(which colordiff) ]]; then
    alias diff='colordiff'
fi

alias valgrind='valgrind --leak-check=full --show-reachable=yes'
alias famaf='ssh ldg0112@mail.famaf.unc.edu.ar'
