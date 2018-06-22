#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s -f $1 $DIR/configs/source-alacritty.yml
$DIR/switch-alacritty.js dark
ln -s -f $DIR/configs/alacritty.yml $2
