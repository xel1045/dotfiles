# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  # Use sublime for my editor.
  export EDITOR='vim'
fi

export PAGER="less"
export LESS="-XFR"

export MAESTRO_WORKSPACE=$HOME/repositories
