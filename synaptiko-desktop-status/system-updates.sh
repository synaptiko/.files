#!/usr/bin/env bash
TMP_FILE=`mktemp`
rm $TMP_FILE
mkfifo $TMP_FILE
while :; do
	cat ~/.files/synaptiko-desktop-status/system-updates.config.json $TMP_FILE \
		| socat unix-connect:/run/synaptiko-desktop-status-bar.socket,forever,interval=1 stdio
	sleep 1
done
