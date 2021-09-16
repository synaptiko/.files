#!/usr/bin/env bash

swaymsg -t get_tree > ~/sway-tree-$(date -Iseconds | cut -d'+' -f1).json
