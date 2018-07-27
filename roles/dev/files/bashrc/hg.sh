get_branch() {
    local DIR="$PWD"
    while [[ "$DIR" != "/" ]]; do
        if [[ -d "$DIR/.hg" ]]; then
            nick=$(hg log --template '{rev}:{node|short}@{branch}' -r . 2>/dev/null)
            [[ -n "$nick" ]] && printf "${1:-(%s)}" "$nick"
            return 0
        fi
        DIR="$(dirname "$DIR")"
    done
}
PS1="\$(get_branch \"$2\")$PS1";

graft() {
  orig_branch="$(hg branch)"
  if [[ "$orig_branch" != "$2" ]]
  then
    orig_branch="$2"
    hg up "$2"
  fi
  hg branch "${1}-${orig_branch}"
  hg graft -r "first(branch(${1}))::"
  hg up "$orig_branch"
}
