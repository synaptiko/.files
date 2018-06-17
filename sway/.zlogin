if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	XKB_DEFAULT_LAYOUT=us XKB_DEFAULT_MODEL=pc105 XKB_DEFAULT_OPTIONS=compose:ralt,caps:escape \
		exec dbus-launch --sh-syntax --exit-with-session \
		sway -V -d &> ~/.sway.log
fi
