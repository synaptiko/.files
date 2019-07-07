#!/usr/bin/env bash

if [[ "$1" == "laptop-keyboard" ]]; then
	swaymsg input "1:1:AT_Translated_Set_2_keyboard" events ${2:-toggle}
elif [[ "$1" == "laptop-touchpad" ]]; then
	swaymsg input "2:14:ETPS/2_Elantech_Touchpad" events ${2:-toggle}
fi
