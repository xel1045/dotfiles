alias reload='. ~/.profile'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias here="open ."

# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias repos="cd ~/repositories"

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

if [[ `which tree` ]]; then
    alias tree_color="tree -C"
fi

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# IP addresses
#alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'

# Flush Directory Service cache
alias flush="sudo discoveryutil udnsflushcaches"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias trimnl="tr -d '\n'"

# Show/hide hidden files in Finder
alias show-hidden-files="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide-hidden-files="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Dotfiles
alias dotedit="e $DOTFILES"

# SSH
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# Docker
alias dl="docker ps -l -q"
alias dps="docker ps"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"
alias ubuntu="docker run -it --rm -v `pwd`:/workspace phusion/baseimage bash"
alias amazonlinux="docker run -it --rm -v `pwd`:/workspace amazonlinux bash"

# Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# PHP
alias p="phpunit"
alias pf="phpunit --filter "
alias php-profile="php -d xdebug.profiler_enable=on"
alias fastest-run='find app/tests tests -name "*Test.php" | vendor/bin/fastest "`which php` vendor/bin/phpunit {}" -vvv'

alias ae="php $HOME/repositories/automate-everything/artisan"
alias phpstorm="/Applications/PhpStorm.app/Contents/MacOS/phpstorm"

# Laravel
alias a="php artisan"

# Vendors
alias c:e="composer"
alias c:s="[ ! -f composer.phar ] && [ -f composer.json ] && curl -sS https://getcomposer.org/installer | php"
alias c:u="c:e self-update && c:e update --profile -vvv"
alias c:i="c:e self-update && c:e install"
alias c:d="c:e self-update && c:e dump-autoload -vvv"

alias y:u="yarn update"
alias y:i="yarn install"

alias n:u="if [ -f yarn.lock ]; then yarn update; else npm update; fi"
alias n:i="if [ -f yarn.lock ]; then yarn install --pure-lockfile; else npm install; fi"

alias b:u="bower update"
alias b:i="bower install"

alias v:i="[ -f composer.json ] && c:i; [ -f package.json ] && n:i; [ -f bower.json ] && b:i"
alias v:u="[ -f composer.json ] && c:u; [ -f package.json ] && n:u; [ -f bower.json ] && b:u"

# Ruby
alias r='rbenv local 1.8.7-p358'

alias sc='script/console'
alias sg='script/generate'
alias sd='script/destroy'

alias migrate='rake db:migrate db:test:clone'

# Editors
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias code='open -a "/Applications/Visual Studio Code.app" "`pwd`"'

# Xcode
alias ios="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

# eXolnet
alias sphp="exo-php-switch"
alias interrupt="ae timelog:interrupt"
alias exolnet-deploy-password="cp-cli credential:list --name='Redmine + Git' --username='exolnet' --safe | jq -r '.[0].password' | trimnl | pbcopy"

# exolnet-scripts
alias exo="exo-scripts"
alias site="exo-scripts site"
alias redmine="exo-scripts redmine"
