#!/usr/bin/env bash
synaptiko-zoom-notification-fixer DP-2 &
$HOME/.files/zoom/share-screen.sh ask &
/usr/bin/zoom "$@"
$HOME/.files/zoom/share-screen.sh stop
pkill synaptiko-zoom-
