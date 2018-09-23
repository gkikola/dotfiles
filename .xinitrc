#!/bin/sh

# Greg Kikola
# ~/.xinitrc
# 2018-09-23

# lock screen after period of inactivity
xautolock -time 20 -locker physlock &

# turn off bell
xset b off

# start window manager
exec stumpwm
