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

set -xg PATH /usr/local/share/npm/bin $PATH

#set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1


set fish_greeting

