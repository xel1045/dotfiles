#
# Bash settings
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Sites

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

# prompt colors
RESET='\e[0m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'

# load the path files
for file in $DOTFILES/**/*.bash-path; do
  source $file
done

# load everything
for file in $DOTFILES/**/*.bash; do
  source $file
done

# load bash completions
for file in $DOTFILES/**/*.bash-completion; do
  source $file
done

# load functions
for file in $DOTFILES/functions/*; do
  source $file
done

# Initialize rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi
