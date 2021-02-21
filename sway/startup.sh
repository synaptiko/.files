#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

systemctl --user import-environment

gammastep -m wayland -r >& /dev/null &

mako >& /dev/null &

kanshi >& /dev/null &

# TODO jprokop: polkit-gnome sucks but polkit-mate segfaults under sway/wayland :-( (revisit later; revisited 11/2020 and was still happening)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >& /dev/null &

$DIR/../wayland-screen-share/gnome-shell-screenshot-dbus-emulator >& /dev/null &

# required for gnome-keyring and seahorse to somehow work
systemctl --user import-environment DISPLAY
dbus-update-activation-environment DISPLAY
