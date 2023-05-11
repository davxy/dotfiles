#!/bin/bash

pkill tail
rm -rf $SWAYSOCK.wob && mkfifo $SWAYSOCK.wob
tail -f $SWAYSOCK.wob | wob