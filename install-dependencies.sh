#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! which yay >& /dev/null; then
	echo "Yay is required; it will be cloned under ~/Packages and installed"
	echo

	mkdir -p ~/Packages
	cd ~/Packages
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -sircC
	cd

	$DIR/yay/install.sh

	echo
	echo "Yay! Move on with real installation now! :-)"
	echo
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
aurDeps=`cat $DIR/*/dependencies | sort | uniq | grep '^aur/' | cut -d'/' -f2 | grep -E -v '^(yay-bin)$' | sort | xargs`

if [ "$onlyMissing" = true ]; then
	pacmanDeps=`pacman -T $pacmanDeps | xargs`
	aurDeps=`pacman -T $aurDeps | xargs`
fi

if [ "$pacmanDeps" != "" ]; then
	echo -e "\e[1msudo pacman -S \e[0m$pacmanDeps"
	if [ "$dryRun" != true ]; then
		sudo pacman -S $pacmanDeps
	fi
fi

if [ "$aurDeps" != "" ]; then
	echo -e "\e[1myay -S \e[0m$aurDeps"
	if [ "$dryRun" != true ]; then
		EDITOR=`which nvim &> /dev/null && echo nvim || echo nano` yay -S $aurDeps
	fi
fi
