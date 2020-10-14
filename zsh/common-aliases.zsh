alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -h'
alias ll='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hl'
alias la='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlA'
alias lt='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlt'
alias ltag='ls -t | ag'

alias grep='grep --color=tty -d skip'

alias df='df -h'

alias recvgpgkey='gpg --recv-keys --keyserver hkp://pool.sks-keyservers.net'

alias track='~/Documents/time-track-utils/track.sh'
alias show-time='~/Documents/time-track-utils/show-time.js'

alias v='vim'
alias y='yarn'
alias ys='yarn start'
alias yb='yarn build'
alias ydb='yarn devbuild'
alias yt='yarn test'

alias xcp='xclip-copyfile'
alias xcu='xclip-cutfile'
alias xpa='xclip-pastefile'

alias yay='sudo -u yay PKGEXT=".pkg.tar" yay'

# One shouldn't add itself to docker group as mentioned here: https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
alias docker='sudo docker'
# alias docker-compose='sudo docker-compose'

# Can it be useful later?
# _() { node -e "process.stdout.write(require('lodash').$1('${2:-$(cat)}'))" }
# _C() { _ capitalize $1 }
# _l() { _ lowerFirst $1 }
# _cC() { _ camelCase $1 }
# _kC() { _ kebabCase $1 }
# _sC() { _ snakeCase $1 }

passwd-rnd() {
	# < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-20}
	openssl rand -base64 32 | tr -dc _A-Z-a-z-0-9 | head -c${1:-20}
	echo
}

uuid() {
	cat /proc/sys/kernel/random/uuid
}

up() {
	UPDATE_MIRRORS="n"
	CLEAN_CACHES="n"
	UPDATE_PACKAGES="y"

	while [ "$#" -gt 0 ]; do
		case "$1" in
			--update-mirrors) UPDATE_MIRRORS="y"; shift 1;;
			--only-update-mirrors) UPDATE_MIRRORS="y"; UPDATE_PACKAGES="n"; shift 1;;
			--clean-caches) CLEAN_CACHES="y"; shift 1;;
			--only-clean-caches) CLEAN_CACHES="y"; UPDATE_PACKAGES="n"; shift 1;;
		esac
	done

	if [ $UPDATE_MIRRORS = "y" ]; then
		echo "sudo systemctl start reflector"
		sudo systemctl start reflector
	fi

	if [ $CLEAN_CACHES = "y" ]; then
		echo "yay -Scc"
		yay -Scc
	fi

	if [ $UPDATE_PACKAGES != "n" ]; then
		if [ -S /run/synaptiko-desktop-status-bus.socket ]; then
			echo '{"getPackageListToUpdate":true}' | socat unix-connect:/run/synaptiko-desktop-status-bus.socket stdio
		fi

		echo "yay --news"
		yay --news

		echo "yay -Syu"
		yay -Syu

		echo "yay -P --stats"
		yay -P --stats

		if [ -S /run/synaptiko-desktop-status-bus.socket ]; then
			echo '{"systemUpdated":true}' | socat unix-connect:/run/synaptiko-desktop-status-bus.socket stdio
		fi
	fi
}
