#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ANDROID_STUDIO_DESKTOP_FILE=~/.local/share/applications/AndroidStudio.desktop
cp $DIR/AndroidStudio.desktop $ANDROID_STUDIO_DESKTOP_FILE
