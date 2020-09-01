#!/bin/bash

cp .vimrc ~

mkdir ~/vimtemp

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c "PluginInstall"

sudo apt install python3-dev
sudo apt install fonts-powerline
sudo apt install clangd

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd

