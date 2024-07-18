# ALT-T - edit selected file
fzf-edit-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local file="$(
    FZF_DEFAULT_COMMAND=${FZF_ALT_C_COMMAND:-} \
    FZF_DEFAULT_OPTS=$(__fzf_defaults "--reverse --walker=file,follow,hidden --scheme=path") \
    FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd) < /dev/tty)"
  if [[ -z "$file" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="vim ${(q)file:a}"
  zle accept-line
  local ret=$?
  unset file # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N             fzf-edit-widget
bindkey -M emacs '\et' fzf-edit-widget
bindkey -M vicmd '\et' fzf-edit-widget
bindkey -M viins '\et' fzf-edit-widget
