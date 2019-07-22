#!/usr/bin/env bash

echo -e "\u001b[33;1mBacking up old files...\u001b[0m";
mv -iv ~/.bashrc ~/.bashrc.old
mv -iv ~/.alias ~/.alias.old
mv -iv ~/.tmux.conf ~/.tmux.conf.old
mv -iv ~/.gitconfig ~/.gitconfig.old
mv -iv ~/.vimrc ~/.vimrc.old

echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
ln -sfnv $CWD/dotfiles/.bashrc ~/.bashrc
ln -sfnv $CWD/dotfiles/.alias ~/.alias
ln -sfnv $CWD/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfnv $CWD/dotfiles/.gitconfig ~/.gitconfig
ln -sfnv $CWD/dotfiles/.vimrc ~/.vimrc
