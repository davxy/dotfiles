#!/bin/bash

pkill tail
rm -rf $WOB_SOCK && mkfifo $WOB_SOCK
tail -f $WOB_SOCK | wob