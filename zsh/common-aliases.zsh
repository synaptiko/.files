alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -h'
alias ll='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hl'
alias la='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlA'
alias lt='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlt'
alias ltag='ls -t | ag'

alias grep='grep --color=tty -d skip'

alias df='df -h'

alias agjs='ag -p .ignore --js -Q'
alias agscss='ag -p .ignore --sass -Q'

alias l='gtk-launch'
alias recvgpgkey='gpg --recv-keys --keyserver hkp://pool.sks-keyservers.net'

alias plan='~/Documents/todo/plan.sh'
alias track='~/Documents/todo/track.sh'
alias show-time='~/Documents/todo/show-time.js'

alias rch='chromium-runner'

randpw() {
	# < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-20}
	openssl rand -base64 32 | tr -dc _A-Z-a-z-0-9 | head -c${1:-20}
	echo
}

up() {
	read -k "UPDATE_MIRRORS?:: Update Pacman mirror list? [y/N] "
	if [ $UPDATE_MIRRORS != $'\n' ]; then
		printf "\n"
	fi

	read -k "UPDATE_AUR?:: Update AUR packages? [Y/n] "
	if [ $UPDATE_AUR != $'\n' ]; then
		printf "\n"
	fi

	if [ $UPDATE_AUR != "n" ]; then
		read -k "UPDATE_DEVEL?:: Update git/svn… packages? [y/N] "
		if [ $UPDATE_DEVEL != $'\n' ]; then
			printf "\n"
		fi
	fi

	read -k "CLEAN_CACHES?:: Clean-up caches after upgrade? [y/N] "
	if [ $CLEAN_CACHES != $'\n' ]; then
		printf "\n"
	fi

	if [ $UPDATE_MIRRORS = "y" ]; then
		echo "sudo systemctl start reflector"
		sudo systemctl start reflector
	fi

	if [ $UPDATE_AUR != "n" ]; then
		if [ $UPDATE_DEVEL = "y" ]; then
			echo "pacaur -Syu --devel"
			pacaur -Syu --devel
		else
			echo "pacaur -Syu"
			pacaur -Syu
		fi

		if [ $CLEAN_CACHES = "y" ]; then
			echo "pacaur -Scc"
			pacaur -Scc
		fi
	else
		echo "sudo pacman -Syu"
		sudo pacman -Syu

		if [ $CLEAN_CACHES = "y" ]; then
			echo "sudo pacman -Scc"
			sudo pacman -Scc
		fi
	fi
}
