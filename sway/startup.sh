#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

redshift -m wayland >& /dev/null &

# TODO jprokop: polkit-gnome sucks but polkit-mate (I use in i3) segfaults under sway/wayland :-( (revisit later)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >& /dev/null &
