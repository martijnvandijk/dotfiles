#!/bin/bash
if [[ $(hostname)  = "fusion" ]]; then
	xrandr --output DVI-I-1 --auto --output HDMI-1 --auto --right-of DVI-I-1 --output HDMI-2 --auto --left-of DVI-I-1
	xrandr --output DVI-I-1 --primary
fi
