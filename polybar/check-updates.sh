#!/usr/bin/env bash
count=$(yay -Pn | tee ~/.last-check-updates-output)

if [[ "$count" != "0" ]]; then
	echo $count
fi
