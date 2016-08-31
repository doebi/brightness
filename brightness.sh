#!/bin/sh
#
# Usage:
# to increace brightness by 5 percent:
# brigtness.sh +5

# to decrease brightness by 5 percent:
# brightness.sh -5

# the basepath
base="/sys/class/backlight/intel_backlight"

# check if argument got passed
if [ -z $1 ]; then
    echo "Usage:\n   brightness.sh +#\nor brightness.sh -#\nwhere # is the percentage you want to change your brightness by\nExample: brightness.sh +5"
    exit
fi

# reading vars from device
# current brightness
b=$(cat $base/brightness)
# maximum brightness
m=$(cat $base/max_brightness)

# calculating step based on input
step=$(($m * $1 / 100))

# calculating resulting brightness
n=$(($b + $step))

# make sure new value is in valid range
if [ 0 -gt $n ]; then
    n=0
elif [ $n -gt $m ]; then
    n=$m
fi

# writing resulting brightness to device
echo $n > $base/brightness
