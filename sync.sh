#!/bin/bash

SYNC="rsync -a --quiet --progress --delete --append-verify"

# bash
$SYNC $HOME/.bashrc bash/bashrc
$SYNC $HOME/.inputrc bash/inputrc

# git
$SYNC $HOME/.gitconfig git/gitconfig

# tmux
$SYNC $HOME/.tmux.conf tmux/tmux.conf

# neovim
$SYNC $HOME/.config/nvim/init.vim nvim/init.vim
$SYNC $HOME/.config/nvim/init-plugins.vim nvim/init-plugins.vim
$SYNC $HOME/.config/nvim/pluggedconf nvim/

# samba
$SYNC /etc/samba/smb.conf samba/smb.conf

# X defaults
$SYNC $HOME/.Xdefaults misc/Xdefaults
