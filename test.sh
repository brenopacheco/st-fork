#!/bin/env bash

# File:   test.sh
# Author: breno
# Email:  breno@Manjaro
# Date:   Wed 17 Feb 2021 01:55:46 PM WET

#!/bin/sh
# exec 1>/dev/null 2>&1
while true; do
    inotifywait -e modify ./config.h
    make && ./st &
    sleep 1
done












# vim: set ft=sh

