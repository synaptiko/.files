#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gammastep -m wayland -r >& /dev/null &

mako >& /dev/null &

kanshi >& /dev/null &

# TODO jprokop: polkit-gnome sucks but polkit-mate segfaults under sway/wayland :-( (revisit later)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >& /dev/null &

# TODO jprokop: this used to work automatically but it's not anymore (investigate later if it's still needed or not)
PIPEWIRE_DEBUG=3 pipewire >& /dev/null &
/usr/lib/xdg-desktop-portal -r >& /dev/null &
/usr/lib/xdg-desktop-portal-wlr >& /dev/null &
