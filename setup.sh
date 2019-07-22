#!/usr/bin/env bash

echo -e "\u001b[33;1mBacking up old files...\u001b[0m";
mv -fv ~/.bashrc ~/.bashrc.old
mv -fv ~/.alias ~/.alias.old
mv -fv ~/.tmux.conf ~/.tmux.conf.old
mv -fv ~/.gitconfig ~/.gitconfig.old
mv -fv ~/.vimrc ~/.vimrc.old

echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
ln -sfnv $PWD/dotfiles/.bashrc ~/.bashrc
ln -sfnv $PWD/dotfiles/.alias ~/.alias
ln -sfnv $PWD/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfnv $PWD/dotfiles/.gitconfig ~/.gitconfig
ln -sfnv $PWD/dotfiles/.vimrc ~/.vimrc
