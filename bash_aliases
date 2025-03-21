alias dirs="dirs -p"
alias du="du -h"
alias df="df -h"
alias grep='grep --color=auto'
alias ls='ls --color=auto --group-directories-first'
alias l1='ls -1'
alias la='ls -A'
alias ll='ls -alFh'
alias less="less -Sn"
alias untar="tar xvzf"
alias wcl="wc -l"
alias zless="zless -Sn"
alias upgrade="sudo apt autoremove -y; sudo apt update && sudo apt upgrade -y"
alias goodbye="upgrade && shutdown now"
alias tmuxa="tmux new -As"
alias makeadir="sudo install -o $(id -un) -g $(id -gn) -d"

alias aurora="cd /projects/2022_AURORA_mutations"
alias auroradata="cd /data2/AURORA_TGS/"
alias auroraresults="cd /data2/AURORA_TGS_reprocessed/PipeIT2/PipeIT/results"
alias instand="cd /projects/2025_INSTAND"
alias instanddata="cd /data2/pipeline_results/2025_INSTAND/"
alias bioinfolab='ssh dario.romagnoli@10.110.128.107'
alias bioinfolab2='ssh dario.romagnoli@10.110.128.61'
alias bioinfolab3='ssh dario.romagnoli@10.110.128.71'
alias ctrend="cd /projects/2019_cTREnd"
alias dataviz="cd /projects/packages/aurora-dataviz"
alias diagenode="cd /projects/2023_Diagenode"
alias diagenodedata="cd /data2/Palbores_Diagenode"
alias meter="cd /projects/packages/METER"
alias libimet='cd /projects/2025_LIBIMET_TGS'
alias libimetdata='cd /data2/pipeline_results/2025_LIBIMET_TGS'
alias mimesisretro='cd /projects/2022_MIMESIS_lowpass'
alias mimesis="cd /projects2/2024_MIMESIS_prospettico"
alias mimesisdata="cd /data2/MethData/MIMESIS"
alias palbowes='cd /projects/2017_Palbores_WES'
alias integrative='cd /projects/2023_Palbores_integrative'
alias papi='cd /projects2/2024_Papi'
alias papidata="cd /data2/pipeline_results/2024_Papi/"
alias pipelines="cd /data2/pipeline_results/"
alias samcount="samtools view -c"
alias singlecells="cd /projects2/2024_Single_ExCELLence"
alias tiresias="cd /projects2/2024_TIRESIAS_ctDNA"
alias tiresiasdata="cd /data2/pipeline_results/2024_TIRESIAS_ctDNA"
alias instand="cd /projects/2025_INSTAND"
alias vimdiff='nvim -d'
