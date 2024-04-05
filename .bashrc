# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi
# Set neovim is default editor
EDITOR=nvim
# avoid duplicates..
export HISTCONTROL=ignoreboth:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; history -n;"
export FZF_DEFAULT_COMMAND='rg --hidden --files'
export FZF_DEFAULT_OPTS="--layout=reverse --border --height=60%"
# Print tree structure in the preview window
export FZF_ALT_C_COMMAND="ls -a"
export FZF_ALT_C_OPTS="--preview 'tree -C -a {}'"

test -s ~/.alias && . ~/.alias || true

alias vim="nvim"

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 39)\]\u\[$(tput setaf 45)\]@\[$(tput setaf 51)\]\h \[$(tput setaf 195)\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# alias
alias l='ls -alFh --color=auto'
alias la='ls -lah --color=auto'
alias ll='ls -alFh --color=auto'
alias ls='ls -h --color=auto'
alias ls-l='ls -lh --color=auto'

# check if function exists and define empty one if doesn't
if [[ $(type -t "__vte_prompt_command") != function ]]; then
	function __vte_prompt_command() {
		return 0
	}
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
