#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! pacman -Qs pacaur >& /dev/null; then
	(>&2 echo "Pacaur is required; install it first")
	exit 1
fi

for arg in $@; do
	case "$arg" in
		--dry-run|-d)
			dryRun=true
			;;
		--only-missing|-o)
			onlyMissing=true
			;;
	esac
done

pacmanDeps=`cat $DIR/*/dependencies | sort | uniq | grep -v '^aur/' | sort | xargs`
pacaurDeps=`cat $DIR/*/dependencies | sort | uniq | grep '^aur/' | cut -d'/' -f2 | grep -E -v '^(pacaur|cower)$' | sort | xargs`

if [ "$onlyMissing" = true ]; then
	pacmanDeps=`pacman -T $pacmanDeps | xargs`
	pacaurDeps=`pacman -T $pacaurDeps | xargs`
fi

if [ "$pacmanDeps" != "" ]; then
	echo -e "\e[1msudo pacman -S \e[0m$pacmanDeps"
	if [ "$dryRun" != true ]; then
		sudo pacman -S $pacmanDeps
	fi
fi

if [ "$pacaurDeps" != "" ]; then
	echo -e "\e[1mpacaur -Sa \e[0m$pacaurDeps"
	if [ "$dryRun" != true ]; then
		EDITOR=`which nvim &> /dev/null && echo nvim || echo nano` pacaur -Sa $pacaurDeps
	fi
fi
