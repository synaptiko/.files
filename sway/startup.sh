#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# instead of sudo you can use pkexec
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &> /dev/null &

kanshi &> /dev/null &
gammastep &> /dev/null &
mako &> /dev/null &
yubikey-touch-detector --libnotify &> /dev/null &
synaptiko-alacritty-zsh-cwd-watcher &> /dev/null &
