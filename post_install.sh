#!/bin/bash
set -eu

# author: Dario Romagnoli
# Small script to install useful programs after brand new installation

echo "############ Add apt repositories ####################"
apt_sources="/etc/apt/sources.list /etc/apt/sources.list.d/*"

# java
ppa=webupd8team/java
if ! grep -q $ppa $apt_sources; then
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    sudo add-apt-repository -y ppa:$ppa
fi

# libreoffice
ppa=libreoffice/ppa
if ! grep -q $ppa $apt_sources; then
    sudo add-apt-repository -y ppa:$ppa
fi

# audacity
ppa=ubuntuhandbook1/audacity
if ! grep -q $ppa $apt_sources; then
    sudo add-apt-repository -y ppa:$ppa
fi

# vim
ppa=jonathonf/vim
if ! grep -q $ppa $apt_sources; then
    sudo add-apt-repository -y ppa:$ppa
fi

# neovim
ppa=neovim-ppa/stable
if ! grep -q $ppa $apt_sources; then
    sudo add-apt-repository -y ppa:$ppa
fi

# chrome
echo "############ Install Chrome ####################"
exist_pkg=$(dpkg -l | grep chrome)
if [ -z exist_pkg ]; then
    if [ ! -e $HOME/Downloads/dropbox_2015.10.28_amd64.deb ]; then
        echo "Please, manually download google-chrome-stable"
    else
        sudo dpkg -i $HOME/Downloads/google-chrome-stable_current_amd64.deb
    fi
else
    echo "Chrome already installed"
fi

# dropbox
echo "############ Install Dropbox ####################"
exist_pkg=$(dpkg -l | grep dropbox)
if [ -z exist_pkg ]; then
    [ ! -e $HOME/Downloads/dropbox_2015.10.28_amd64.deb ] && wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -p $HOME/Downloads
    sudo dpkg -i $HOME/Downloads/dropbox_2015.10.28_amd64.deb
else
    echo "Dropbox already installed"
fi

echo "############ Update and install softwares ####################"
sudo apt update
sudo apt install -fy htop gnome-tweak-tool git chrome-gnome-shell \
    ubuntu-restricted-extras \
    screenruler \
    gtk-redshift checkinstall libevent-dev libncurses5-dev curl \
    libcanberra-gtk-module \
    texmaker rename sshfs \
    audacity libreoffice oracle-java8-installer vim neovim


echo "############ Download dotfiles ####################"
# dotfiles
[ ! -d $HOME/.dotfiles ] && git clone https://github.com/romagnolid/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
./install.sh
cd ~

echo "############ Download vim plugins ####################"
# vim plugins
[ ! -d $HOME/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux
echo "############ Download and install tmux ####################"
exist_pkg=$(dpkg -l | grep tmux)
if [ -z exist_pkg ]; then
    [ ! -e $HOME/Downloads/tmux-2.7.tar.gz ] && wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz -p $HOME/Downloads
    tar xvzf $HOME/Downloads/tmux-2.7.tar.gz --directory $HOME/Downloads
    cd $HOME/Downloads/tmux-2.7
    ./configure
    sudo checkinstall
    cd ~
fi

echo "############ Download tmux plugins ####################"
# tmux plugins (plugins must than be installed using 'prefix + I')
[ ! -f $HOME/.tmux/reset ] && curl --create-dirs -Lo $HOME/.tmux/reset https://raw.githubusercontent.com/hallazzang/tmux-reset/master/tmux-reset
[ ! -d $HOME/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
