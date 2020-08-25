# Created by newuser for 5.8
source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen theme candy
antigen apply

alias ls="ls --color=auto --group-directories-first"

eval $(dircolors $HOME/.dotfiles/dir_colors)

[ -f $HOME/.aliases ] && source $HOME/.aliases
