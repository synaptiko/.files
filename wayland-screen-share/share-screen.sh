#!/usr/bin/env bash
if ! lsmod | grep v4l2loopback > /dev/null; then
	echo "Adding v42loopback module to kernel"
	sudo modprobe v4l2loopback
fi
{
if [ $1 == "stop" ]; then
	if pgrep ffplay > /dev/null; then
		pkill ffplay > /dev/null
	fi
	if pgrep wf-recorder > /dev/null; then
		pkill wf-recorder > /dev/null
	fi
	notify-send -t 2000 "Wayland recording has been stopped"
elif [ $1 == "is-recording" ]; then
	if pgrep wf-recorder > /dev/null && pgrep ffplay > /dev/null; then
		notify-send -t 2000 "Wayland recording is up"
	else
		notify-send -t 2000 "No Wayland recording"
	fi
else
	if ! pgrep wf-recorder > /dev/null; then
		geometry=$(~/.files/wayland-screen-share/select-area.sh) || exit $?

		wf-recorder --muxer=v4l2 --force-yuv --codec=rawvideo --file=/dev/video2 --geometry="$geometry" &
	fi
	if ! pgrep ffplay; then
		unset SDL_VIDEODRIVER
		ffplay /dev/video2 &
		sleep 0.5
		# a hack so FPS is not dropping
		swaymsg "[class=ffplay]" move position 2555 1410
		swaymsg focus tiling
	fi
	notify-send -t 2000 "Wayland recording has been started"
fi
} > ~/.wayland-share-screen.log 2>&1
