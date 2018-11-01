#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

redshift >& /dev/null &

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 >& /dev/null &

# Disable DPMS and prevent screen from blanking
xset s off -dpms
compton -b --config $DIR/compton.config
nitrogen --restore
