#!/usr/bin/env bash
if [ $# -eq 0 ] || [ ! -L /tmp/nvimsocket ]; then
	xfce4-terminal -x nvim >& /dev/null
	sleep 0.1
	newInstance=true
else
	newInstance=false
fi

if [ $# -gt 0 ]; then
	if $newInstance ; then
		nvr --remote $1 >& /dev/null
		shift
	fi

	for file in "$@"; do
		nvr --remote-tab $file >& /dev/null
	done
fi

if ! $newInstance ; then
	NVIM_LISTEN_ADDRESS=`readlink -f /tmp/nvimsocket`
	WID=`xdotool search --name Neovim@$NVIM_LISTEN_ADDRESS`
	seturgent $WID 1 >& /dev/null
fi
