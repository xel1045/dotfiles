# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/repositories

# Retrieve the shell name
SHELL_NAME=$(basename $SHELL)

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

# configure paths
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/Documents/Development/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# load everything
for file in $DOTFILES/shell/*.{sh,$SHELL_NAME}; do
  source $file
done
