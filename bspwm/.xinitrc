#!/bin/bash
export LANG=en_US.UTF-8
#set -U SXHKD_SHELL /usr/bin/bash
SXHKD_SHELL=/usr/bin/bash sxhkd &
exec bspwm
