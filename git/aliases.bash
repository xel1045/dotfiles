# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
#hub_path=$(which hub)
#if (( $+commands[hub] ))
#then
#  alias git=$hub_path
#fi

# The rest of my fun git aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"
alias wip="git add . && git commit -m 'wip'"

alias bfg='java -jar "$DOTFILES/bin/bfg.jar"'

alias nah="git reset --hard; git clean -df;"

alias t="phpunit"
alias tf="phpunit --filter "

alias vm='ssh vagrant@127.0.0.1 -p 2222'
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

function openpr() {
  br=`git branch | grep "*"`
  repo=$1
  parentBranch=$2

  open -a /Applications/Google\ Chrome.app  https://github.com/${repo/* /}/compare/${parentBranch/* /}...themsaid:${br/* /}\?expand\=1
}