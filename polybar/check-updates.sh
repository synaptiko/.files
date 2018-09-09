#!/usr/bin/env bash
count=$(yay -Qu | wc -l)

if [[ "$count" != "0" ]]; then
	echo $count
fi
