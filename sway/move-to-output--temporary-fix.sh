#!/usr/bin/env sh
workspace=`swaymsg -t get_tree | ~/.files/sway/get-active-workspace.ts $1`
swaymsg move container to workspace $workspace
