#!/bin/bash

if [[ $(basename $PWD) != dotfiles ]]; then
    echo "Error: must run from 'dotfiles'"
    exit 1
fi

ln -sf $PWD/.vimrc $HOME/.vimrc
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
ln -sf $PWD/.Rprofile $HOME/.Rprofile
