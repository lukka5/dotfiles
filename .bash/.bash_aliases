alias ls='ls --color=auto'
alias la='ls -A'
alias lsx='ls -AX'

alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias llx='ls -lAhX'

alias t='tree'
alias ..='cd ..'

alias tmuxconf='vim ~/.tmux.conf'
alias vim='vim --servername VIM'
alias vimr='vim --remote'
alias vimrc='vim ~/.vimrc'
alias gvir='gvim --remote'
alias gvimrc='gvim ~/.vimrc'

alias so='source ~/.bashrc'
alias bashrc='vim ~/.bashrc'
alias aliases='vim ~/.bash/.bash_aliases'
alias functions='vim ~/.bash/.bash_functions'
alias prompt='vim ~/.bash/.bash_prompt'

alias grep='grep --color=auto'
alias diff='colordiff'

alias dfh='df -h'
alias duh='du -h'
alias freeh='free -h'
alias rm='rm -I'
alias rmbk='rm *~'

alias evince='evince 2>/dev/null'
alias eog='eog 2>/dev/null'
alias valgrind='valgrind --leak-check=full --show-reachable=yes'
alias gitfamaf='ssh gitmaster@git.famaf.unc.edu.ar'
alias famaf='ssh ldg0112@mail.famaf.unc.edu.ar'
alias mini='ssh adc201441@mini.famaf.unc.edu.ar'
alias ev='ebook-viewer'
alias ice='iceweasel'

alias howto='vim ~/Dropbox/howto'
alias links='vim ~/Dropbox/links'
alias notes='vim ~/Dropbox/notes'
alias todo='vim ~/Dropbox/todo'
alias shots='eog ~/pictures/shots/'
alias maps='eog ~/Dropbox/img/gameofthrones/maps/*'

alias sub='unzip -q ~/downloads/*.zip -d .; rm ~/downloads/*.zip; ll'

alias ton='xinput --enable `xinput --list --id-only "SynPS/2 Synaptics TouchPad"`'
alias toff='xinput --disable `xinput --list --id-only "SynPS/2 Synaptics TouchPad"`'

alias record='wodim -v -pad -eject speed=1 dev=/dev/sg1 -dao -swab *.wav'

# vim: set ft=sh:
