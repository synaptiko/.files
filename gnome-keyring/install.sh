#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Based on instructions in https://wiki.archlinux.org/title/GNOME/Keyring
# There is also initialization part inside sway/zlogin file

sudo $DIR/update-pam.d-login.ts

PASSWD_PAM=/etc/pam.d/passwd
PASSWD_PART="password	optional	pam_gnome_keyring.so"
if ! grep -Fxq "$PASSWD_PART" "$PASSWD_PAM"; then
	echo "$PASSWD_PART" | sudo tee --append $PASSWD_PAM >& /dev/null
fi

sudo ln -s -f $DIR/gnome-keyring.portal /usr/share/xdg-desktop-portal/portals/gnome-keyring-wlroots.portal

GNUPG_CONFIG_DIR=~/.gnupg
mkdir -p $GNUPG_CONFIG_DIR
sudo ln -s -f $DIR/gpg-agent.conf $GNUPG_CONFIG_DIR/gpg-agent.conf

pinentry=`grep pinentry-program $DIR/gpg-agent.conf | cut -d' ' -f2`
if ! ls -la /usr/bin/pinentry 2> /dev/null | grep $pinentry >& /dev/null; then
	sudo ln -s -f $pinentry /usr/bin/pinentry
fi
