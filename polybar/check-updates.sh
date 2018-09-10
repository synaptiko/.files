#!/usr/bin/env bash
count=$(sudo -u yay yay -Qu | wc -l)

if [[ "$count" != "0" ]]; then
	echo $count
fi
