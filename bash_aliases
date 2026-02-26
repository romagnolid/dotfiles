alias du="du -h"
alias df="df -h"
alias ls='ls --color=auto --group-directories-first'
alias l1='ls -1'
alias untar="tar xvzf"
alias less="less -Sn"
alias zless="zless -Sn"
alias upgrade="sudo apt autoremove -y; sudo apt update && sudo apt upgrade -y"
alias goodbye="upgrade && shutdown now"
alias makeadir="sudo install -o $(id -un) -g $(id -gn) -d"

alias bioinfolab='ssh dario.romagnoli@10.110.128.107'
alias bioinfolab2='ssh dario.romagnoli@10.110.128.61'
alias bioinfolab3='ssh dario.romagnoli@10.110.128.71'
alias dayhoff="ssh AS184359@dayhoff"
alias turing="ssh AS184359@turing"

alias_root="~/Bioinfolab"
alias mimesis="cd $alias_root/projects2/2024_MIMESIS_prospettico"
