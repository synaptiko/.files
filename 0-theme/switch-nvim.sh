#!/usr/bin/env bash
theme=$1

for filename in /tmp/nvim*/0; do
	nvr --nostart --servername "$filename" -c "set background=${theme:-dark}" -c "hi! Normal ctermbg=none guibg=none" &
done
