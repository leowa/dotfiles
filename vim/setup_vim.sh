#!/usr/bin/env bash
set -ex
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if test ! -d ~/.vim/bundle/vundle; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

ln -sf $PWD/vimrc ~/.vimrc

vim +BundleInstall +qall
[ -d ~/.vim/bundle/vimproc ] && {
    cd ~/.vim/bundle/vimproc
    make
    cd -
}

# Set up flake8 default conf file
#[ -d ~/.config ] || mkdir ~/.config
#cp -f "$__dir/flake8" ~/.config/flake8
