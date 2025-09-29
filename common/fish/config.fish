# Version 0.1.3
#
# Depends on
# - zellij
# - starship
# - eza
# - zoxide
# - bat
# - yazi

if not status is-interactive
    return
end

if not set -q TMPDIR
    set TMPDIR (dirname (mktemp))
end

#############################################
# Exports
#############################################

# Path
set -xp PATH "$HOME/bin" "$HOME/.local/bin" "$HOME/.cargo/bin"

# Default editor
# This should be done before zellij setup to make scrollback edit work.
set -x EDITOR "$HOME/bin/hx"

# VPN config files
set -x VPN_CONFIG_DIR "$HOME/.wireguard"

# Default options for 'fzf'
set -x FZF_DEFAULT_OPTS "--history=$TMPDIR/fzf-history --no-sort --exact"

# Exclude the specified folders from the zoxide database
set -x _ZO_EXCLUDE_DIRS "/mnt/data:/mnt/data/*"
# Resolve symlinks before adding directories to the database
set -x _ZO_RESOLVE_SYMLINKS 1
# Print matched directory before navigating to it
# set -x _ZO_ECHO 1

# Dark theme for gtk applications
set -x GTK_THEME "Adwaita:dark"

# Folder for Go stuff
set -x GOPATH "$HOME/.go"

# To make Wayland clipboard work
set -x COSMIC_DATA_CONTROL_ENABLED 1

# Local folder for pip venvs
set -x PIP_LOCAL_VENVS "$HOME/.local/pip"

# File where we write the last visited folder
set -x CWD_FILE "$TMPDIR/$USER"_cwd_file

# By default libvirt uses 'qemu:///session'
set -x LIBVIRT_DEFAULT_URI "qemu:///system"

# Default terminal
set -x TERMINAL alacritty

# Cosmic terminal is based on alacritty
set -x TERM alacritty

# Auto exit from zellij
set -x ZELLIJ_AUTO_EXIT true

# GPG as SSH auth agent
set -e SSH_AGENT_PID
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# PERSONAL DEV STUFF
set -x JAM_CONFORMANCE_DIR /mnt/ssd/develop/jam/jam-conformance
set -x JAM_REPORTS_DIR "$JAM_CONFORMANCE_DIR/fuzz-reports/0.7.0/reports"
set -x JAM_TRACES_DIR "$JAM_CONFORMANCE_DIR/fuzz-reports/0.7.0/traces"
set -x JAM_SOCK "/tmp/jam_target.sock"

#############################################
# Start zellij
#############################################

function zellij
    if test "$ZELLIJ_AUTO_ATTACH" = true
        command zellij attach -c
    else if test (count $argv) -gt 0
        command zellij $argv
    else if set -q ZELLIJ
        command zellij action new-tab
    else
        command zellij
        if test -f "$TMPDIR/zexit"
            rm "$TMPDIR/zexit"
        else
            kill $fish_pid
        end
    end
end

function zexit
    if set -q ZELLIJ
        touch $TMPDIR/zexit
        exit
    else
        echo "Zellij not running"
    end
end

if not set -q ZELLIJ
    zellij
end

#############################################
# Fish specific settings
#############################################

# Remove fish greeting
set fish_greeting

# Set vi key bindings
set fish_key_bindings fish_vi_key_bindings

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block blink
# Set the insert mode cursor to a line
set fish_cursor_insert line blink
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore blink
set fish_cursor_replace underscore blink
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line blink
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block blink

#############################################
# Alias
#############################################

# helix
if not command -q hx
    alias hx='helix'
end
# alacritty
alias term=alacritty
# bat
alias cat='bat -pP'
# ripgrep
alias grep=rg
alias gr=rg
# eza
alias ls=eza
alias ll='eza -lg'
alias la='eza -ag'
alias lla='eza -alg'
alias tree='eza -T'
# zoxide
alias cd=z
alias ze="fzf --bind 'enter:execute(rifle {})'"
# python
alias py=python
# git
alias g=git
# gitui
alias gu=gitui
# zellij
alias zj=zellij
# jless
alias jl=jless
# paru
alias pa=paru
# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# misc
alias wd=pwd
# ai
alias aid=aider
alias aic=aichat
# common stuff
alias unix='date +%s'

#############################################
# Misc
#############################################

# Restore the last visited folder when a new terminal is opened
if set -q CWD_FILE
    if test -f $CWD_FILE
        set -l target_dir (cat $CWD_FILE)
        # use builtin cd (been aliased to z)
        builtin cd $target_dir
    else
        touch $CWD_FILE
        chmod 600 $CWD_FILE
    end
end

function my_pre_prompt --on-event fish_prompt
    echo "$PWD" >"$CWD_FILE"
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function _pip_activate
    set -l env_name $argv[1]
    set -l pip_venvs

    if test (count $argv) -gt 1; and test $argv[2] = pipx
        set pip_venvs (pipx environment -V PIPX_LOCAL_VENVS)
    else
        set pip_venvs $PIP_LOCAL_VENVS
    end

    set -l env_path "$pip_venvs/$env_name/bin/activate.fish"

    if test -f "$env_path"
        source "$env_path"
    else
        echo "environment '$env_name' not found in '$pip_venvs'."
    end
end

function pip-activate
    _pip_activate $argv[1]
end

function pipx-activate
    _pip_activate $argv[1] pipx
end

# Open detached
function opend
    for i in $argv
        nohup xdg-open $i >/dev/null 2>&1 &
    end
end

#############################################
# Third party tools init
#############################################

fzf_key_bindings

starship init fish | source

zoxide init fish | source
