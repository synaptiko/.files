#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/switch-alacritty.js $1 &
$DIR/switch-nvim.sh $1 &
