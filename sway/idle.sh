#!/usr/bin/env bash
function turn_on_swayidle {
	swayidle -w \
			timeout 300 '~/.files/sway/lock.sh' \
			timeout 360 'swaymsg "output * dpms off"' \
			resume 'swaymsg "output * dpms on"' \
			before-sleep '~/.files/sway/lock.sh' &> /dev/null &
}

case "$1" in
	timeout-now)
		pgrep swayidle || turn_on_swayidle
		sleep 1
		pkill -USR1 swayidle # TODO jprokop: this seems to be broken, try to debug & report an issue
		;;
	toggle)
		pgrep swayidle && pkill swayidle || turn_on_swayidle
		;;
	*)
		if [ "$HOST" = "jprokop-tp13" ]; then
			turn_on_swayidle
		fi
		;;
esac
