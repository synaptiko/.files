if [[ -z $SSH_CONNECTION && "$USER" != "root" ]]; then
	# See https://wiki.archlinux.org/index.php/GnuPG#gpg-agent

	# I'm using:
	# 1. systemd service for starting gpg-agent:
	#    - systemctl --user enable gpg-agent.socket 
	#    - systemctl --user enable gpg-agent-ssh.socket
	#    - systemctl --user enable gpg-agent-browser.socket
	# 2. ~/.pam_environment for SSH_AUTH_SOCK
	# 3. ~/.gnupg/gpg-agent.conf with enable-ssh-support

	# See https://github.com/jamessan/vim-gnupg/blob/master/plugin/gnupg.vim#L32
	export GPG_TTY=`tty`

	# Refresh gpg-agent tty in case user switches into an X session
	gpg-connect-agent updatestartuptty /bye >/dev/null
fi
