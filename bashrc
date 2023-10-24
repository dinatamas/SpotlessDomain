# https://wiki.archlinux.org/title/Bash/Prompt_customization
# https://github.com/ohmybash/oh-my-bash/wiki/Themes
# Better history: https://askubuntu.com/a/339925

if [ -n "$SSH_CLIENT" ]; then
  PS1=$'\n \[\e[90m\]\W\[\e[m\] \[\e[34m\]▸❯\[\e[0m\] '
else
  PS1=$'\n \[\e[90m\]\W\[\e[m\] \[\e[34m\]❯\[\e[0m\] '
fi

export HISTCONTROL=erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

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

# Bash can handle terminal control sequences better than zsh,
# hence there is no need for the same escape configurations.

source_if_exists() { if [ -f "$1" ]; then source "$1"; fi }

source_if_exists "$HOME/.bashrc.local"
source_if_exists "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash"
