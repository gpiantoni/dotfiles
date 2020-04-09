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

# Tasse
export PATH=~/tools/icedtea-web/bin:$PATH
export PATH=~/tools/DesktopTelematico:$PATH

alias chesstempo=~/tools/chesstempo/import_chesstempo.py
alias economist=~/tools/economist/economist.py

# WINE32
export WINEARCH=win32
