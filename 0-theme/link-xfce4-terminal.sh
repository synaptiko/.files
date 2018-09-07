#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s -f $1 $DIR/configs/source-xfce4-terminal-terminalrc
$DIR/switch-xfce4-terminal.js dark

rm -f $2
# do not symlink, xfce4-terminal cannot handle changes to symlinked file properly anyway
cp -f $DIR/configs/xfce4-terminal-terminalrc $2
# but remember where it's linked (so we don't have to hardcode the destination anywhere in `0-theme` folder)
ln -s -f $2 $DIR/configs/link-to-xfce4-terminal-terminalrc
