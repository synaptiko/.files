#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$1" in
	--dry-run|-d)
		dryRun="y"
		;;
esac

if ! pacman -Qs pacaur >& /dev/null; then
	(>&2 echo "Pacaur is required; install it first")
fi

pacmanDeps=`cat $DIR/*/dependencies | uniq | grep -v '^aur/' | sort | xargs`
pacaurDeps=`cat $DIR/*/dependencies | uniq | grep '^aur/' | cut -d'/' -f2 | grep -E -v '^(pacaur|cower)$' | sort | xargs`

echo -e "\e[1msudo pacman -S \e[0m$pacmanDeps"
if [ "$dryRun" != "y" ]; then
	sudo pacman -S $pacmanDeps
fi

echo
echo -e "\e[1mpacaur -Sa \e[0m$pacaurDeps"
if [ "$dryRun" != "y" ]; then
	pacaur -Sa $pacaurDeps
fi
