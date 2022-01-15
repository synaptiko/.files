#!/usr/bin/env sh
workspace=`swaymsg -t get_tree | jq '.nodes[] | select(.type == "output") | select(.name == "'$1'") | .current_workspace'`
swaymsg move container to workspace $workspace
swaymsg workspace $workspace

~/.files/sway/switch-output.sh $2
