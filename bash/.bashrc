#
# ~/.bashrc
#
export HOUDINI_USER_PREF_DIR="$HOME/.config/houdini__HVER__"
export HOUDINI_OLD_SPINNER=true

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
