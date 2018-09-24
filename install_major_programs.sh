#!/bin/bash
set -eu

# author: Dario Romagnoli
# Small script to install commonly used useful after brand new installation

sudo apt install -y htop gnome-tweak-tool vim git chrome-gnome-shell \
	gtk-redshift checkinstall libevent-dev libncurses-dev curl

dpkg -l | grep google-chrome-stable -q || sudo dpkg -i $HOME/Downloads/google-chrome-stable_current_amd64.deb
dpkg -l | grep dropbox -q || sudo dpkg -i $HOME/Downloads/dropbox_2015.10.28_amd64.deb

sudo apt install -f

# dotfiles
[ ! -d $HOME/.dotfiles ] && git clone https://github.com/romagnolid/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
./install.sh
cd ~

# vim plugins
[ ! -d $HOME/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux
exist_pkg=$(dpkg -l | grep tmux)
if [ -z exist_pkg ]; then
    [ ! -e $HOME/Downloads/tmux-2.7.tar.gz ] && wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz -p $HOME/Downloads
    tar xvzf $HOME/Downloads/tmux-2.7.tar.gz --directory $HOME/Downloads
    cd $HOME/Downloads/tmux-2.7
    ./configure
    sudo checkinstall
    cd ~
fi

# tmux plugins: install with prefix + I
[ ! -f $HOME/.tmux/reset ] && curl -Lo $HOME/.tmux/reset --create-dirs https://raw.githubusercontent.com/hallazzang/tmux-reset/master/tmux-reset
[ ! -d $HOME/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

