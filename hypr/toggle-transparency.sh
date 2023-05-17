#!/bin/bash
#
# Hack to toggle opacity

active_default=$(grep " active_opacity" $HOME/.config/hypr/hyprland.conf | awk '{ print $3 }')
inactive_default=$(grep " inactive_opacity" $HOME/.config/hypr/hyprland.conf | awk '{ print $3 }')

curr=$(hyprctl getoption decoration:active_opacity | grep float | awk '{print $2}')
curr=$(echo "${curr:0:3}")

if [[ $curr == "1.0" ]]; then
  hyprctl keyword decoration:active_opacity $active_default
  hyprctl keyword decoration:inactive_opacity $inactive_default
else
  hyprctl keyword decoration:active_opacity 1
  hyprctl keyword decoration:inactive_opacity 1
fi
