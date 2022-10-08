#!/bin/bash

pkill tail
rm -rf $SWAYSOCK.wob && mkfifo $SWAYSOCK.wob
tail -f $SWAYSOCK.wob | wob --anchor "top" \
    --anchor "right" \
    --width  300 \
    --height 20 \
    --offset 0 \
    --border 1 \
    --margin 10 \
    --background-color '#262626aa' \
    --border-color '#d4be98aa' \
    --bar-color '#d4be98aa'
