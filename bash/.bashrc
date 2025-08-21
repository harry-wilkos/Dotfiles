#
# ~/.bashrc
#
export HOUDINI_USER_PREF_DIR="$HOME/.config/houdini__HVER__"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
