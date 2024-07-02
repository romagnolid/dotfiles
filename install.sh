#!/bin/bash

folder=".dotfiles"
if [[ $(basename $PWD) != "$folder" ]]; then
    echo "Error: must run from '$folder'"
    exit 1
fi

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.vim/after/colors/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ln -sf $PWD/tmux.reset.conf   $HOME/.tmux/
# ln -sf $PWD/zshrc             $HOME/.zshrc
ln -sf $PWD/bash_aliases      $HOME/.bash_aliases
ln -sf $PWD/bashrc            $HOME/.bashrc
ln -sf $PWD/filetype.vim      $HOME/.vim/
ln -sf $PWD/gitconfig         $HOME/.gitconfig
ln -sf $PWD/init.vim          $HOME/.config/nvim
ln -sf $PWD/inputrc           $HOME/.inputrc
ln -sf $PWD/Rprofile          $HOME/.Rprofile
ln -sf $PWD/skeleton*         $HOME/.vim/
ln -sf $PWD/tender.vim        $HOME/.vim/after/colors/
ln -sf $PWD/tmux.conf         $HOME/.tmux.conf
ln -sf $PWD/vimrc             $HOME/.vimrc
