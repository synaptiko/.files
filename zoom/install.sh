#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ZOOM_DESKTOP_FILE=~/.local/share/applications/Xoom.desktop
cp $DIR/Xoom.desktop $ZOOM_DESKTOP_FILE

ZOOM_WRAPPER_DIR=/opt/xoom
sudo mkdir -p $ZOOM_WRAPPER_DIR
sudo cp $DIR/wrapper.sh $ZOOM_WRAPPER_DIR

ZOOM_CONFIG=~/.config/zoomus.conf
if [ -f $ZOOM_CONFIG ]; then
	if grep -Fxq "[AS]" $ZOOM_CONFIG; then
		sed -i -E 's/^showframewindow=true$/showframewindow=false/' $ZOOM_CONFIG
	else
		echo -e "\n[AS]\nshowframewindow=false" >> $ZOOM_CONFIG
	fi
else
	echo "You need to re-run ./.files/zoom/install.sh after you run Zoom for the first time as $ZOOM_CONFIG doesn't exist yet."
fi

MIMEINFO_CACHE=~/.local/share/applications/mimeinfo.cache
if [ ! -f $MIMEINFO_CACHE ]; then
	echo "[MIME Cache]" > $MIMEINFO_CACHE
fi
echo "application/x-zoom=Xoom.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/callto=Xoom.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/tel=Xoom.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/zoommtg=Xoom.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/zoomphonecall=Xoom.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/zoomus=Xoom.desktop;" >> $MIMEINFO_CACHE
