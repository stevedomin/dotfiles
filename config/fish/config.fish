# Reload all functions
. ~/.config/fish/functions/*.fish

function rehash
  . ~/.config/fish/config.fish
end

function flush
  dscacheutil -flushcache
end

# 
#	PATH
#

# GOPATH
set -xg GOPATH /Users/steve/src/go

set -xg PATH /Users/steve/src/go/bin /usr/local/sbin $PATH
set -xg PATH /usr/local/share/npm/bin $PATH

set PATH $HOME/.rbenv/bin $PATH
#set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

#set -x PATH /Users/steve/src/gc/paylinks/node_modules/.bin $PATH

# GoCardless
#set -x PATH /Users/steve/src/gc/auth-service/.bundle/binstubs $PATH
#set -x PATH /Users/steve/src/gc/gocardless/.bundle/binstubs $PATH
#set -x PATH /Users/steve/src/gc/music-server/.bundle/binstubs $PATH

set fish_greeting

