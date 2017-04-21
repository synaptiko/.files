#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

QT4_CONFIG=~/.config/Trolltech.conf
if [ -f $QT4_CONFIG ]; then
	sed -E -i 's/(^font=).\+$/\1"Cantarell,11,-1,5,50,0,0,0,0,0"/' $QT4_CONFIG
	sed -E -i 's/(^style=).\+$/\1Adwaita/' $QT4_CONFIG
else
	(>&2 echo "Qt4 couldn't be configured; missing $QT4_CONFIG")
	exit 1
fi

QT5_CONFIG_DIR=~/.config/qt5ct
mkdir -p $QT5_CONFIG_DIR
QT5_CONFIG=$QT5_CONFIG_DIR/gt5ct.conf
ln -s -f $DIR/qt5ct.conf $QT5_CONFIG

GTK2_CONFIG=~/.gtkrc-2.0
ln -s -f $DIR/gtkrc-2.0 $GTK2_CONFIG

GTK3_CONFIG_DIR=~/.config/gtk-3.0
mkdir -p $GTK3_CONFIG_DIR
GTK3_CONFIG=$GTK3_CONFIG_DIR/settings.ini
ln -s -f $DIR/gtk-3.0-settings.ini $GTK3_CONFIG
