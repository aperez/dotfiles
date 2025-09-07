#!/bin/sh

while true; do
    datetime=$(date +'%Y-%m-%d %X')
    capacity=""

    if [ -f /sys/class/power_supply/BAT0/capacity ]; then
        capacity="[$(cat /sys/class/power_supply/BAT0/capacity)%] "
    fi

    echo "$capacity$datetime"
    sleep 1
done
