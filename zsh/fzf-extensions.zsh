if ! type fzf &> /dev/null; then
    return;
fi

# TODO jprokop: clean it up a little and move extra file?
# TODO jprokop: rename and provide proper description (that it overrides "built-in" fzf-zsh function)!
# ALT-C - cd into the selected directory
fzf-cd-widget() {
  setopt localoptions pipefail 2> /dev/null
    local dir="$(eval "command ~/Projects/recent-folders/list-recent-folders ~/.recent-folders" | fzf | ~/Projects/recent-folders/normalize-path)"

  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi

    if [[ -d "$dir" ]]; then
        cd "$dir"
        local ret=$?
        zle fzf-redraw-prompt
        typeset -f zle-line-init >/dev/null && zle zle-line-init
        return $ret
    else
        echo -e "\033[0;31m$origDir was not found\033[0;00m"
        return 1
    fi
}

zle     -N    fzf-cd-widget
bindkey '\ec' fzf-cd-widget

# TODO jprokop: finish/adapt to new approach!
# ignore-current-dir() {
#     # grep -v "$PWD" ~/.recent-folders > ~/.recent-folders.tmp
#     # grep -v "${PWD:s/$HOME/~}" ~/.recent-folders > ~/.recent-folders.tmp
#     grep -v "${PWD:s/\/home\/jprokop/~}" ~/.recent-folders > ~/.recent-folders.tmp
#     mv ~/.recent-folders.tmp ~/.recent-folders
# }

is_in_git_repo() {
	git rev-parse HEAD > /dev/null 2>&1
}

fgs() {
	is_in_git_repo || return
	local -a files

	# TODO jprokop: consider to add 'ctrl-g' to expect to run 'git add {+}' instead of vim!
	git -c 'color.ui=always' status -s | fzf --ansi -m "$@" | while read -r item; do
		filename=`echo $item | cut -d " " -f 2-`
		files+=($filename)
	done

	vim -p $files
}

# TODO jprokop: rewrite to the form of `fgs` function so it won't be running fzf in background
# TODO jprokop: add Ctrl+T to run with `vim -p`; leave Enter to execute just `vim` (so it's in sync with fzf in vim)
alias f='fzf -m --bind "enter:execute(vim -p {+}),ctrl-c:execute-silent(xclip-copyfile {+}),ctrl-x:execute-silent(xclip-cutfile {+})"'

autoload -Uz add-zsh-hook

visit_folder() {
	if [ "$PWD" != "$HOME" ]; then
		~/Projects/recent-folders/visit-folder ~/.recent-folders "$PWD"
	fi
}

add-zsh-hook chpwd visit_folder
