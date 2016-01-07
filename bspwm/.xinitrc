#!/bin/bash
#set -U SXHKD_SHELL /usr/bin/bash
SXHKD_SHELL=/usr/bin/bash sxhkd &
exec bspwm
