# matches case insensitive for lowercase
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
#zstyle ':completion:*' insert-tab pending

#[ -f /usr/local/etc/zsh_completion ] && . /usr/local/etc/zsh_completion
#[ -f /usr/local/bin/aws_zsh_completer.sh ] && . /usr/local/bin/aws_zsh_completer.sh

# Homebrew autocompletions
#if type brew &>/dev/null; then
#  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
#fi