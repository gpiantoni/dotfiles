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

export PATH=$PATH:~/.gem/ruby/2.5.0/bin

alias wc="youtube-dl PLCGIzmTE4d0hww7NG9ytmooEUZov2k-23 -i --playlist-start 31"
