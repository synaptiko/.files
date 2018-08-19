#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

THEME=$1
COMMAND="call SwitchTheme('${THEME:-dark}')"

# switch theme in all locally running nvim instances
for filename in /tmp/nvim*/0; do
	if [ -e $filename ]; then
		nvr --nostart --servername "$filename" -c "$COMMAND" &
	fi
done

# persist theme for future nvim instances
echo "$COMMAND" > $DIR/configs/nvim.vim
