#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ZOOM_DESKTOP_FILE=~/.local/share/applications/ZoomX11.desktop
cp $DIR/ZoomX11.desktop $ZOOM_DESKTOP_FILE

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
echo "application/x-zoom=ZoomX11.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/callto=ZoomX11.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/tel=ZoomX11.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/zoommtg=ZoomX11.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/zoomphonecall=ZoomX11.desktop;" >> $MIMEINFO_CACHE
echo "x-scheme-handler/zoomus=ZoomX11.desktop;" >> $MIMEINFO_CACHE
