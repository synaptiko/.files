#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo mkdir -p /etc/pacman.d/hooks
sudo ln -s -f $DIR/sway-set-capabilities.hook /etc/pacman.d/hooks/sway-set-capabilities.hook

# TODO jprokop: parse it from user-dirs.dirs instead
mkdir -p ~/{Downloads,Documents,Music,Pictures,Videos,Packages,Projects,work}
USER_DIRS_CONFIG=~/.config/user-dirs.dirs
ln -s -f $DIR/user-dirs.dirs $USER_DIRS_CONFIG
xdg-user-dirs-update

SWAY_CONFIG_DIR=~/.config/sway
mkdir -p $SWAY_CONFIG_DIR
SWAY_CONFIG=$SWAY_CONFIG_DIR/config
ln -s -f $DIR/config $SWAY_CONFIG

SWAYLOCK_CONFIG_DIR=~/.config/swaylock
mkdir -p $SWAYLOCK_CONFIG_DIR
SWAYLOCK_CONFIG=$SWAYLOCK_CONFIG_DIR/config
ln -s -f $DIR/swaylock/config $SWAYLOCK_CONFIG

MAKO_CONFIG_DIR=~/.config/mako
mkdir -p $MAKO_CONFIG_DIR
MAKO_CONFIG=$MAKO_CONFIG_DIR/config
ln -s -f $DIR/mako/config $MAKO_CONFIG

$DIR/../0-theme/switch-sway.js dark

# TODO jprokop: setup GUI libraries to work properly under Wayland: https://wiki.archlinux.org/index.php/Wayland#GUI_libraries
