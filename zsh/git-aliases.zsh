alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gr='git rm'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep --break --heading --line-number'
alias gcm='git commit'
alias gpl='git pull --rebase'
alias gps='git push'
alias gsth='git stash'
alias gstp='git stash pop'
alias gfp='git fetch --prune'
alias gcho='git checkout'
alias gchrp='git cherry-pick -x'
alias grbs='git fetch upstream && git rebase upstream/master'

gnbr() {
	git checkout -b $1
	git push --set-upstream origin $1
}
