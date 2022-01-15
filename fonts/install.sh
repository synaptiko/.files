#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# this is from: https://gist.github.com/cole-h/8aab0ed9d65efe38496e8e27b96b6a3d (but it doesn't seem to work in Alacritty)
FONTS_CONF_AVAIL_DIR=/etc/fonts/conf.avail
FONTS_CONF_D_DIR=/etc/fonts/conf.d
sudo cp $DIR/75-noto-color-emoji.conf $FONTS_CONF_AVAIL_DIR
sudo ln -s -f $FONTS_CONF_AVAIL_DIR/75-noto-color-emoji.conf $FONTS_CONF_D_DIR
# this is from: https://dev.to/darksmile92/get-emojis-working-on-arch-linux-with-noto-fonts-emoji-2a9 (and it makes it work in Alacritty)
FONTS_LOCAL_CONF=/etc/fonts/local.conf
sudo ln -s -f $DIR/fonts-local.conf $FONTS_LOCAL_CONF
fc-cache
