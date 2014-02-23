alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias la='ls -A'
alias lsx='ls -AX'

alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'
alias llx='ls -lAhX'

alias ..='cd ..'

alias emacs='emacs -nw'
alias tmuxconf='vim ~/.tmux.conf'
alias vim='vim --servername VIM'
alias vimr='vim --remote'
alias vimrc='vim ~/.vimrc'
alias gvir='gvim --remote'
alias gvimrc='gvim ~/.vimrc'
alias gvims='gvim --servername'
alias mars='java -jar /usr/local/bin/Mars4_3.jar'

alias so='source ~/.bashrc'
alias bashrc='vim ~/.bashrc'
alias aliases='vim ~/.bash_aliases'

alias dfh='df -h'
alias duh='du -h'
alias freeh='free -h'
alias rm='rm -I'
alias rmbk='rm *~'
alias al='alsamixer'
alias pst='ps -aux | tail'
alias ev='ebook-viewer'

alias valgrind='valgrind --leak-check=full --show-reachable=yes'
alias gitfamaf='ssh gitmaster@git.famaf.unc.edu.ar'

alias howto='vim ~/Dropbox/how-to'
alias links='vim ~/Dropbox/links'
alias notes='vim ~/Dropbox/notes'
alias shots='eog ~/Pictures/shots/'
alias famaf='ssh ldg0112@mail.famaf.unc.edu.ar'

alias enq='rhythmbox-client --enqueue'
alias clearq='rhythmbox-client --clear-queue'

alias sub='unzip -q ~/Downloads/*.zip -d .; rm ~/Downloads/*.zip; ll'

alias ton='xinput --enable `xinput --list --id-only "SynPS/2 Synaptics TouchPad"`'
alias toff='xinput --disable `xinput --list --id-only "SynPS/2 Synaptics TouchPad"`'


# vim: set ft=sh:
