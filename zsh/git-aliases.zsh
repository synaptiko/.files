alias lg='lazygit'
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gr='git rm'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep --break --heading --line-number'
alias gcm='git commit'
alias gcmm='git commit -m'
alias gcma='git commit --amend'
alias gpl='git pull --rebase'
alias gps='git push'
alias gpsb='git push && gbackup'
alias gpsf='git push --force-with-lease'
alias gpsfb='git push --force-with-lease && gbackup'
alias gpst='git push --tags'
alias gsth='git stash'
alias gstp='git stash pop'
alias gfp='git fetch --prune'
alias gfpup='git fetch --prune upstream'
alias gcho='git checkout'
alias gchrp='git cherry-pick -x'
alias grbs='git fetch --prune upstream && git rebase upstream/master'
alias gdbr='git branch -d'
alias gDbr='git branch -D'

gnbr() {
	git checkout -b $1
	git push --set-upstream origin $1
	echo
	echo "\e[33mTip: use \e[0m\e[1;33mgchb $1\e[0m\e[33m next time!\e[0m"
}

# smarter git checkout, combination of gcho & gnbr
gchb() {
	if ! git checkout $1; then
		git checkout -b $1
		git push --set-upstream origin $1
	fi
}

gdcm() {
    echo 'Commits that exist in '$1' but not in '$2':'
    git log --graph --pretty=format:'%Cred%h%Creset %s' --abbrev-commit $2..$1
    echo 'Commits that exist in '$2' but not in '$1':'
    git log --graph --pretty=format:'%Cred%h%Creset %s' --abbrev-commit $1..$2
}

gbackup() {
	if git remote -v | grep backup > /dev/null; then
		git push --mirror backup
	elif [[ "$1" == "add" ]]; then
		git remote add backup git@git.lan:synaptiko/$(basename `git rev-parse --show-toplevel`).git
	else
		echo 'Backup remote is not added, you need to add it first with:'
		echo 'gbackup add'
	fi
}

gsync() {
	if git branch --show-current | grep -E "^master$" > /dev/null; then
		if git remote -v | grep -E "^upstream\s+" > /dev/null; then
			if git rev-parse --abbrev-ref HEAD@{upstream} | grep -E "^origin/master$" > /dev/null; then
				fetchResult=$(mktemp)
				echo "git fetch --prune"
				git fetch --prune 2>&1 | tee $fetchResult
				echo "git fetch --prune upstream"
				git fetch --prune upstream 2>&1 | tee -a $fetchResult
				echo "git rebase upstream/master"
				git rebase upstream/master
				echo "git push"
				git push

				echo
				branchesToDelete=$(mktemp)
				# TODO jprokop: improve later, somehow detect that branches are related to the remote and also that they do not contain unpushed changes
				sed -e "/^ - \[deleted\]/!d" $fetchResult | sed -e "s/^.*\/\([^/]*\)$/\1/" | sort | uniq > $branchesToDelete
				cat $branchesToDelete | xargs -p git branch -D

				rm $branchesToDelete $fetchResult
			else
				echo "This branch doesn't track origin remote; gsync currently doesn't support this."
			fi
		else
			echo "This repository doesn't have upstream remote defined; gsync currently doesn't support this."
		fi
	else
		echo "Not on master branch; gsync currently doesn't support this."
	fi
}
