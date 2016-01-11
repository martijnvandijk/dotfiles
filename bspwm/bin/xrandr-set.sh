#!/bin/bash
if [[ $(hostname)  = "fusion" ]]; then
	xrandr --output DVI-I-1 --auto --primary
	xrandr --output HDMI-0 --auto --right-of DVI-I-1 
	xrandr --output HDMI-1 --auto --left-of DVI-I-1
fi
