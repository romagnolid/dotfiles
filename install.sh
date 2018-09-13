#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

ln -sf $PWD/.vimrc           $HOME/.vimrc
ln -sf $PWD/.tmux.conf       $HOME/.tmux.conf
ln -sf $PWD/.Rprofile        $HOME/.Rprofile
ln -sf $PWD/.gitconfig       $HOME/.gitconfig
ln -sf $PWD/.inputrc         $HOME/.inputrc
ln -sf $PWD/redshift.conf    $HOME/.config/
