#!/usr/bin/env bash
$HOME/.files/zoom/share-screen.sh ask &
/usr/bin/zoom "$@"
$HOME/.files/zoom/share-screen.sh stop
