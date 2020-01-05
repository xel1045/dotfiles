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
