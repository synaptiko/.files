#!/usr/bin/env sh
case $1 in
	toggle)
		echo '{"volume":true,"user":"'$USER'","toggleMuted":true}' | socat unix-connect:/run/synaptiko-desktop-status-bus.socket stdio
		;;
	set)
		echo '{"volume":true,"user":"'$USER'","setVolume":'$2'}' | socat unix-connect:/run/synaptiko-desktop-status-bus.socket stdio
		;;
	*)
		echo '{"volume":true,"user":"'$USER'","updateVolume":'$1'}' | socat unix-connect:/run/synaptiko-desktop-status-bus.socket stdio
		;;
esac
