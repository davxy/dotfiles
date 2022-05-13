#!/bin/bash

#CP="rsync -a --quiet --progress --delete --append-verify"
RM="rm -r"
CP="cp -r"

# bash
$CP $HOME/.bashrc bash/bashrc
$CP $HOME/.inputrc bash/inputrc

# git
$CP $HOME/.gitconfig git/gitconfig

# tmux
$CP $HOME/.tmux.conf tmux/tmux.conf

# neovim
$RM nvim/*
$CP $HOME/.config/nvim/init.vim nvim/init.vim
$CP $HOME/.config/nvim/plugins.vim nvim/plugins.vim
$CP $HOME/.config/nvim/init.d nvim/

# samba
$CP /etc/samba/smb.conf samba/smb.conf

# X defaults
$CP $HOME/.Xdefaults misc/Xdefaults

# lldb
$CP $HOME/.lldbinit lldb/lldbinit
$CP $HOME/.lldb/scripts lldb/
