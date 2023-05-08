#!/bin/bash

BRIGHTNESS_MIN="0.4"
BRIGHTNESS_MID="0.7"
BRIGHTNESS_MAX="1.0"

declare -a DISPLAYS=(
    "eDP-1"
    "DP-2"
    "DP-3"
)

function usage()
{
    printf "usage: tba\n"
}

function dark()
{
    
    for i in ${DISPLAYS[@]}; do
	xrandr --output $i --brightness $BRIGHTNESS_MID
    done

}

function bright()
{
    for i in ${DISPLAYS[@]}; do
	xrandr --output $i --brightness $BRIGHTNESS_MAX
    done
}

case ${1} in
    bright)
	bright
	;;
    dark)
	dark
	;;
    *)
	usage
	;;
esac

