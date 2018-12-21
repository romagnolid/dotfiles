#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

# curl https://raw.githubusercontent.com/hallazzang/tmux-reset/master/tmux-reset -o tmux.reset.conf
mkdir -p $HOME/.config/nvim
ln -sf $PWD/gitconfig         $HOME/.gitconfig
ln -sf $PWD/Rprofile          $HOME/.Rprofile
ln -sf $PWD/bash_aliases      $HOME/.bash_aliases
ln -sf $PWD/bashrc            $HOME/.bashrc
ln -sf $PWD/filetype.vim      $HOME/.vim/
ln -sf $PWD/skeleton*         $HOME/.vim/
ln -sf $PWD/init.vim          $HOME/.config/nvim
ln -sf $PWD/inputrc           $HOME/.inputrc
ln -sf $PWD/redshift.conf     $HOME/.config/
ln -sf $PWD/tmux.conf         $HOME/.tmux.conf
ln -sf $PWD/tmux.reset.conf   $HOME/.tmux/
ln -sf $PWD/vimrc             $HOME/.vimrc
