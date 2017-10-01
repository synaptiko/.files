#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmpDir=`mktemp -d`

pacaurDeps=`cat $DIR/*/dependencies | sort | uniq | grep '^aur/' | cut -d'/' -f2 | grep -E -v '^(pacaur|cower)$' | grep -E -v '^adwaita-qt' | sort | xargs`
# adwaita-qt4 & adwaita-qt5 are grouped under adwaita-qt
pacaurDeps="$pacaurDeps adwaita-qt"

for pkg	in $pacaurDeps; do
	wget -q https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=$pkg -O $tmpDir/$pkg
	pgpKeys=`grep validpgpkeys $tmpDir/$pkg | cut -d"'" -f2`
	for pgpKey in $pgpKeys; do
		gpg --recv-keys --keyserver hkp://pool.sks-keyservers.net $pgpKey
	done
done
