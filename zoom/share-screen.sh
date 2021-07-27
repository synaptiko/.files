#!/usr/bin/env bash
{
if [ $1 == "stop" ]; then
	if pgrep wf-recorder > /dev/null; then
		pkill wf-recorder > /dev/null
		notify-send -t 2000 "Screensharing disabled"
	fi
elif [ $1 == "ask" ]; then
	if ! pgrep wf-recorder > /dev/null; then
		START=`dunstify -b -u low -t 15000 "Enable screensharing? (click to enable)"`

		if [ $START == 2 ]; then
			if ! lsmod | grep v4l2loopback > /dev/null; then
				echo "Adding v42loopback module to kernel"
				sudo modprobe v4l2loopback card_label=XoomScreenSharing
			fi
			wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video2 --pixel-format=yuv420p --output DP-2 &
			notify-send -t 2000 "Screensharing enabled"
		fi
	fi
else
	if ! lsmod | grep v4l2loopback > /dev/null; then
		echo "Adding v42loopback module to kernel"
		sudo modprobe v4l2loopback card_label=XoomScreenSharing
	fi
	wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video2 --pixel-format=yuv420p --output DP-2 &
	notify-send -t 2000 "Screensharing enabled"
fi
} > ~/.wayland-share-screen.log 2>&1
