#!/bin/bash
#
# Tool to synchronize versioned and system dot files.

SYNC="rsync -av --progress --delete"

# Array of 'system | versioned' file couples
files=(
    # bash
    "$HOME/.bashrc | bash/bashrc"
    "$HOME/.inputrc | bash/inputrc"
    # git
    "$HOME/.gitconfig | git/gitconfig"
    # tmux
    "$HOME/.tmux.conf | tmux/tmux.conf"
    # neovim
    "$HOME/.config/nvim/init.vim | nvim/init.vim"
    "$HOME/.config/nvim/plugins.vim | nvim/plugins.vim"
    "$HOME/.config/nvim/init.d/ | nvim/init.d/"
    # X defaults
    "$HOME/.Xdefaults | misc/Xdefaults"
    # lldb
    "$HOME/.lldbinit | lldb/lldbinit"
    "$HOME/.lldb/scripts/ | lldb/scripts/"
    # samba
    "/etc/samba/smb.conf | samba/smb.conf"
)

if [[ $1 == "out" ]]; then
    echo "Syncing OUT"
    out=1
elif [[ $1 == "in" ]]; then
    echo "Syncing IN"
    out=0
else
    echo "Usage: sync in|out [--confirm]"
    echo "  in : copy files from system folders"
    echo "  out: copy files to system folders"
    echo "  --confirm: prompt for confirmation before synchronization"
    exit
fi

confirm=0
if [[ $2 == "--confirm" ]]; then
    confirm=1
fi

for file in "${files[@]}"; do
    system_file=$(echo $file | cut -d'|' -f1)
    local_file=$(echo $file | cut -d'|' -f2)

    if [[ $out == 1 ]]; then
        in_file=$local_file
        out_file=$system_file
    else
        in_file=$system_file
        out_file=$local_file
    fi

    echo "* " $in_file "->" $out_file

    if [[ $confirm == 1 ]]; then
        printf "proceed [N/y]? "
        read confirmed
    else
        confirmed="y"
    fi

    if [[ $confirmed == "y" ]]; then
        $SYNC $in_file $out_file
    fi
done
