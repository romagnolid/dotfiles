#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

mkdir -p $HOME/.config/nvim
ln -sf $PWD/init.vim          $HOME/.config/nvim
ln -sf $PWD/bashrc            $HOME/.bashrc
ln -sf $PWD/bash_aliase       $HOME/.bash_aliases
ln -sf $PWD/Rprofile          $HOME/.Rprofile
ln -sf $PWD/.gitconfig         $HOME/.gitconfig
ln -sf $PWD/inputrc           $HOME/.inputrc
ln -sf $PWD/tmux.conf         $HOME/.tmux.conf
ln -sf $PWD/vimrc             $HOME/.vimrc
ln -sf $PWD/redshift.conf     $HOME/.config/
