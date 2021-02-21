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
alias gpsf='git push --force-with-lease'
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
}

gdcm() {
    echo 'Commits that exist in '$1' but not in '$2':'
    git log --graph --pretty=format:'%Cred%h%Creset %s' --abbrev-commit $2..$1
    echo 'Commits that exist in '$2' but not in '$1':'
    git log --graph --pretty=format:'%Cred%h%Creset %s' --abbrev-commit $1..$2
}
