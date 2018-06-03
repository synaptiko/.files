#!/usr/bin/env bash
count=$(yay -Pn)

if [[ "$count" != "0" ]]; then
	echo $count
fi
