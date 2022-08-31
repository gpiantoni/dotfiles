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

# kepubify
export PATH=$PATH:~/tools/economist/bin/

# Tasse
export PATH=~/tools/icedtea-web/bin:$PATH
export PATH=~/tools/DesktopTelematico:$PATH

alias chesstempo=~/tools/chesstempo/import_chesstempo.py

# WINE32
export WINEARCH=win32

here () {
  mkdir /home/gio/projects/$1 -p
  rsync -aPW stein:/Fridge/users/giovanni/projects/$1 /home/gio/projects/$1
}

nfs () {
    rsync --recursive -vv --delete --filter="protect /.well-known" --exclude '.git'  /home/gio/Dropbox/Docs/website/ gpiantoni:/home/public/
}
