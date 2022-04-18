#!/bin/bash

# bash
cp $HOME/.bashrc bash/bashrc
cp $HOME/.inputrc bash/inputrc

# git
cp $HOME/.gitconfig git/gitconfig

# tmux
cp $HOME/.tmux.conf tmux/tmux.conf

# neovim
cp $HOME/.config/nvim/init.vim nvim/init.vim
cp $HOME/.config/nvim/init-plugins.vim nvim/init-plugins.vim
cp -r $HOME/.config/nvim/pluggedconf nvim/pluggedconf

# samba
cp /etc/samba/smb.conf samba/smb.conf

# X defaults
cp $HOME/.Xdefaults misc/Xdefaults
