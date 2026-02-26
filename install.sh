#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

if [ ! -e ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/RyanMacG/tpm-redux.git ~/.tmux/plugins/tpm-redux

fi

ln -sf $PWD/bashrc            $HOME/.bashrc
ln -sf $PWD/bash_aliases      $HOME/.bash_aliases
ln -sf $PWD/Rprofile          $HOME/.Rprofile
ln -sf $PWD/gitconfig         $HOME/.gitconfig
ln -sf $PWD/tmux.conf $HOME/tmux.conf
