#!/bin/bash

case "$OSTYPE" in
    linux-gnu)
        CPU=`eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); intervaltotal=$((total-${prevtotal:-0})); echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))"`
        FREE_MEM=`free | grep "Mem" | awk '{print $3/$2*100;}'`
        printf "%3.d%%C %3.d%%M " $CPU $FREE_MEM
        ;;
esac