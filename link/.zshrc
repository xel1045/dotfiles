# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [[ -a ~/.profile ]]; then
  source ~/.profile
fi