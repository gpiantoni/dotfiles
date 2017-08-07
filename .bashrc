#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h:\w]\$ '

source ~/.bashrc_secrets
export R_LIBS_USER=~/tools/R

export PATH=$PATH:~/.local/bin
