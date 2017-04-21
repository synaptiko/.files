#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

compton -b --config $DIR/compton.config
nitrogen --restore
redshift >& /dev/null &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 >& /dev/null &

# TODO make deja-dup mandatory?
if pacman -Qs deja-dup >& /dev/null; then
	/usr/lib/deja-dup/deja-dup/deja-dup-monitor >& /dev/null &
fi
