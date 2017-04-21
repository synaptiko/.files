#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GNUPG_CONFIG_DIR=~/.gnupg
if [ ! -d $GNUPG_CONFIG_DIR ]; then
	(>&2 echo "GnuPG couldn't be configured; missing $GNUPG_CONFIG_DIR")
	exit 1
fi

GNUPG_CONFIG=$GNUPG_CONFIG_DIR/gpg-agent.conf
ln -s -f $DIR/gpg-agent.conf $GNUPG_CONFIG

pinentry=`grep pinentry-program $DIR/gpg-agent.conf | cut -d' ' -f2`
if ! ls -la /usr/bin/pinentry | grep $pinentry >& /dev/null; then
	sudo ln -s -f $pinentry /usr/bin/pinentry
fi

PAM_ENVIRONMENT_CONFIG=~/.pam_environment
ln -s -f $DIR/pam_environment $PAM_ENVIRONMENT_FILE

if ! systemctl --user is-enabled gpg-agent.socket >& /dev/null; then
	systemctl --user enable gpg-agent.socket
fi

if ! systemctl --user is-enabled gpg-agent-ssh.socket >& /dev/null; then
	systemctl --user enable gpg-agent-ssh.socket
fi

if ! systemctl --user is-enabled gpg-agent-browser.socket >& /dev/null; then
	systemctl --user enable gpg-agent-browser.socket
fi
