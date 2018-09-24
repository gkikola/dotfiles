#!/bin/sh

# Greg Kikola
# ~/.xinitrc
# 2018-09-23

# lock screen after period of inactivity
xset +dpms dpms 1200 1200 1200
xautolock -time 20 -locker 'i3lock -c 000000' &

# turn off bell
xset b off

# start window manager
exec stumpwm
