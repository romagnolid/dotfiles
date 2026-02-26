#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

if [ ! -e ~/.tmux/plugins/tpm-redux ]; then
	git clone https://github.com/RyanMacG/tpm-redux.git ~/.tmux/plugins/tpm-redux

fi
if [ ! -e ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


ln -sf $PWD/bashrc       $HOME/.bashrc
ln -sf $PWD/bash_aliases $HOME/.bash_aliases
ln -sf $PWD/Rprofile     $HOME/.Rprofile
ln -sf $PWD/gitconfig    $HOME/.gitconfig
ln -sf $PWD/tmux.conf    $HOME/.tmux.conf
ln -sf $PWD/vimrc        $HOME/.vimrc
