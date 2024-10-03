#!/bin/bash
#
# Toggle window border

border_mode="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true).border')"

if [[ $border_mode == "normal" ]]; then
    border_mode="pixel"
else
    border_mode="normal"
fi

swaymsg border $border_mode

