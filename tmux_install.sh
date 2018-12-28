#!/usr/bin/env bash
set -eu

sudo apt install checkinstall -y
echo "############ Download and install tmux ####################"
if [ ! -e $HOME/Downloads/tmux-2.7.tar.gz ]; then
    wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz -P $HOME/Downloads
    tar xvzf $HOME/Downloads/tmux-2.7.tar.gz --directory $HOME/Downloads
fi
cd $HOME/Downloads/tmux-2.7
./configure
make
sudo checkinstall
cd ~

echo "############ Download tmux plugins ####################"
# tmux plugins (plugins must than be installed using 'prefix + I')
[ ! -f $HOME/.tmux/reset ] && curl --create-dirs -Lo $HOME/.tmux/reset https://raw.githubusercontent.com/hallazzang/tmux-reset/master/tmux-reset
[ ! -d $HOME/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
