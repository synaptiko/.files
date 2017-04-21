#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

HOSTNAME=`hostname`
I3_CONFIG_DIR=$HOME/.config/i3
I3_CONFIG_FILE=$I3_CONFIG_DIR/config

mkdir -p $I3_CONFIG_DIR

if [ -h $I3_CONFIG_FILE ]; then
	rm $I3_CONFIG_FILE
fi

touch $I3_CONFIG_FILE
chmod u+w $I3_CONFIG_FILE

CONFIG_BASE=$DIR/config.base
head -1 $CONFIG_BASE > $I3_CONFIG_FILE
echo "# DON'T EDIT DIRECTLY! EDIT FILES IN $DIR" >> $I3_CONFIG_FILE
echo "# Source: $CONFIG_BASE" >> $I3_CONFIG_FILE
tail -n +2 $CONFIG_BASE >> $I3_CONFIG_FILE

if [[ "$HOSTNAME" == "jprokop" ]]; then
	CONFIG_JPROKOP=$DIR/config.jprokop
	echo >> $I3_CONFIG_FILE
	echo "# Source: $CONFIG_JPROKOP" >> $I3_CONFIG_FILE
	tail -n +2 $CONFIG_JPROKOP >> $I3_CONFIG_FILE
elif [[ "$HOSTNAME" == "jprokop-tp13" ]]; then
	if xrandr | grep "HDMI1 connected" >& /dev/null; then
		CONFIG_JPROKOP_TP13=$DIR/config.jprokop-tp13
		echo >> $I3_CONFIG_FILE
		echo "# Source: $CONFIG_JPROKOP_TP13" >> $I3_CONFIG_FILE
		tail -n +2 $CONFIG_JPROKOP_TP13 >> $I3_CONFIG_FILE
	fi
fi

chmod u-w $I3_CONFIG_FILE
