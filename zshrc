# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# https://www.soberkoder.com/better-zsh-history/
# zsh-newuser-install

if [ -n "$SSH_CLIENT" ]; then
  PROMPT=$'\n %F{8}%1~%f %F{4}▸❯%f '
else
  PROMPT=$'\n %F{8}%1~%f %F{4}❯%f '
fi

setopt hist_ignore_all_dups
export SAVEHIST=100000
export HISTSIZE=100000
setopt inc_append_history

export PYTHONDONTWRITEBYTECODE=1

export EDITOR='hx'
export VISUAL='nvim'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bat='bat -fP --theme="Visual Studio Dark+" --style=full'
alias btm='btm --battery'
alias dust='dust -r -w=$(tput cols) | sed "s/▓/ /g"'
alias eza='eza -algh --icons --git'
alias fd='fd -pHL'
alias rg='rg -pSL --hidden -M=2000'

export FZF_DEFAULT_OPTS="--color=gutter:-1,bg+:-1 --padding 1 --reverse"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --no-scrollbar --info=right"
if [ -n "$TMUX" ]; then export FZF_TMUX=1; export FZF_TMUX_OPTS="-p"; fi

export CLICOLOR=1
export COLORTERM=1

alias less='less -r'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

eval_if_exists() { command -v "$1" &>/dev/null && eval $( eval "$@" ); }

eval_if_exists /home/linuxbrew/.linuxbrew/bin/brew shellenv
eval_if_exists /opt/homebrew/bin/brew shellenv
eval_if_exists keychain -q --eval

# Force Emacs mode. It's best to learn it, it's used everywhere.
#  - https://douglasrumbaugh.com/post/shell-emacs-mode/
set -o emacs

# zsh does not understand some "fancy" keys by default.
# OS-level configs in /etc/zshrc and /etc/zsh/zshrc usually take care of it,
# however they are often incomplete and don't work across SSH or within tmux.
# This is especially true for application / raw (normal) mode differences.
#  - https://wiki.archlinux.org/title/Home_and_End_keys_not_working
#  - https://github.com/kovidgoyal/kitty/discussions/5248
#  - https://zsh.sourceforge.io/FAQ/zshfaq03.html#l26
#  - https://stackoverflow.com/a/21965133
#  - https://www.reddit.com/r/zsh/comments/eblqvq/
# Use `cat -v` or `kitten show_key -m kitty` to inspect espace sequences.
bindkey '\e[H' beginning-of-line
bindkey '\eOH' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\eOF' end-of-line

# TTYs (incl. SSH) send VT220-style function keys. For some reason.
#  - https://en.wikipedia.org/wiki/ANSI_escape_code#Terminal_input_sequences
#  - https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
#  - https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
# However, it's probably better to stick with Bash and Emacs-controls there.
bindkey -s '^[[1~' '\e[H'   # Home
bindkey -s '^[[3~' '\e[3~'  # Delete
bindkey -s '^[[4~' '\e[F'   # End

# zsh does not provide PgUp / PgDn scrolling. Use the terminal's shortcuts.

source_if_exists() { if [ -f "$1" ]; then source "$1"; fi }

source_if_exists "$HOME/.zshrc.local"
source_if_exists "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
