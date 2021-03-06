#http://fishshell.com/docs/current/commands.html#source
#source ~/.config/fish/config.fish causes fish to re-read its initialization file.

#http://vivafan.com/2013/03/%E3%80%8Cfish%E3%80%8D%E3%82%B7%E3%82%A7%E3%83%AB%E3%82%92%E5%AE%9F%E9%9A%9B%E3%81%AB%E4%BD%BF%E3%81%86%E3%81%9F%E3%82%81%E3%81%AB/

set -gx LANG ja_JP.UTF-8
set -gx LESSCHARSET utf-8
set -gx JLESSCHARSET japanese-utf-8

alias chrome "google-chrome-stable --disk-cache-dir="\/radmisk" --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications -ssl-version-min=tls1"

#alias sechrome="google-chrome-stable --disk-cache-dir="/ramdisk" --incognito --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications -ssl-version-min=tls1"

#alias chrome="google-chrome-stable --disk-cache-dir="/radmisk" --disable-background-mode --disk-cache-size=1 --disk-cache-size=1 --enable-click-to-play --disable-geolocation --enable-desktop-notifications -ssl-version-min=tls1"

#alias rm="rm -i"
alias vi "vim"

alias upd "sudo apt-fast update"
alias upg "sudo freshclam;sudo apt-fast update;sudo apt-fast dist-upgrade -y"

set -g -x PATH /usr/local/bin /usr/local/sbin $PATH


set RBENV_ROOT $HOME/.rbenv  
set -g -x PATH /usr/local/bin /usr/local/sbin $PATH  
alias nano "nano -w"

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
#rbenv rehash >/dev/null ^&1

set PATH $HOME/.rbenv/bin/rbenv $PATH
set PATH $HOME/.rbenv/bin/ruby-local-exec $PATH
eval rbenv init -

#rbenv rehash >/dev/null ^&1

set -x PATH $HOME/.cabal/bin $PATH
set -x PATH $HOME/.cabal/ $PATH
set PATH $HOME/.cabal/bin $PATH
set PATH $HOME/.cabal/ $PATH

#eval "$(rbenv init -)";
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
