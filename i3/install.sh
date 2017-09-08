#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

XINITRC_CONFIG=~/.xinitrc
ln -s -f $DIR/xinitrc $XINITRC_CONFIG

ZLOGIN_CONFIG=~/.zlogin
ln -s -f $DIR/zlogin $ZLOGIN_CONFIG

XORG_KEYBOARD_CONF_FILE=/etc/X11/xorg.conf.d/00-keyboard.conf
sudo ln -s -f $DIR/xorg.conf.d-00-keyboard.conf $XORG_KEYBOARD_CONF_FILE

XORG_TOUCHPAD_CONF_FILE=/etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s -f $DIR/xorg.conf.d-30-touchpad.conf $XORG_TOUCHPAD_CONF_FILE

# TODO jprokop: parse it from user-dirs.dirs instead
mkdir -p ~/{Downloads,Documents,Music,Pictures,Videos,Packages,Projects,work}
USER_DIRS_CONFIG=~/.config/user-dirs.dirs
ln -s -f $DIR/user-dirs.dirs $USER_DIRS_CONFIG
xdg-user-dirs-update
