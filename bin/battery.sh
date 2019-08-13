#!/usr/bin/env bash
percent=`pmset -g batt | grep InternalBattery | awk ' { print $3 } ' | tr -d '%;'`

symbol=""
if [ "$percent" == 100 ]; then
    symbol=🔋;
elif [ "$percent" > 60 ]; then
    symbol=⚡;
else
    symbol=🔌;
fi
echo -n "$symbol $percent%";
