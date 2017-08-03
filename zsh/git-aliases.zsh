alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gr='git rm'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep --break --heading --line-number'
alias gcm='git commit'
alias gcma='git commit --amend'
alias gpl='git pull --rebase'
alias gps='git push'
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
