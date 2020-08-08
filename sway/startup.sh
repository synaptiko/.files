#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# `-v` is provided because of this https://gitlab.com/chinstrap/gammastep/-/issues/2
gammastep -m wayland -r -v >& /dev/null &

mako >& /dev/null &

kanshi >& /dev/null &

# TODO jprokop: polkit-gnome sucks but polkit-mate segfaults under sway/wayland :-( (revisit later)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >& /dev/null &
