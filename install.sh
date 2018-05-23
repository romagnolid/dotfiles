#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

cp $HOME/.vimrc      $HOME/.vimrc.bak
cp $HOME/.tmux.conf  $HOME/.tmux.conf.bak
cp $HOME/.Rprofile   $HOME/.Rprofile.bak
cp $HOME/.gitconfig  $HOME/.gitconfig.bak
cp $HOME/.inputrc    $HOME/.inputrc.bak
cp $HOME/.bashrc     $HOME/.bashrc.bak

ln -sf $PWD/.vimrc      $HOME/.vimrc
ln -sf $PWD/.tmux.conf  $HOME/.tmux.conf
ln -sf $PWD/.Rprofile   $HOME/.Rprofile
ln -sf $PWD/.gitconfig  $HOME/.gitconfig
ln -sf $PWD/.inputrc    $HOME/.inputrc
ln -sf $PWD/.bashrc     $HOME/.bashrc
