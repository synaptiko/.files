#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

AVATAR_FILE=~/.face
EMAIL_HASH=$(echo -n jiri-prokop@synaptiko.cz | md5sum - | cut -d " " -f 1)
wget --quiet -O jprokop.png http://www.gravatar.com/avatar/${EMAIL_HASH}.png?size=160
mv jprokop.png $AVATAR_FILE
