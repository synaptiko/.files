#!/usr/bin/env dash
CWD=$HOME
UID=`id -u`

if [ -f "/tmp/.current-cwd-$UID" ]; then
	CWD=`cat /tmp/.current-cwd-$UID`
	if [ -d "$CWD" ]; then
		if [[ "$CWD" != "$HOME" ]]; then
			recent-dirs visit ~/.recent-dirs "$CWD"
		fi
	else
		CWD=$HOME
	fi
fi

swaymsg "exec alacritty --working-directory=$CWD $@"
