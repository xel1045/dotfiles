# Append to the history file, don't overwrite it
shopt -s histappend

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth

# The maximum number of lines contained in the history file.
export HISTFILESIZE=100000

# The number of commands to remember in the command history.
export HISTSIZE=50000
