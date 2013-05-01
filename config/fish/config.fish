set fish_greeting

# -------------------------------------------- 
# ENV
# -------------------------------------------- 

set -xg GOPATH /Users/steve/src/go
set -xg KNIFE_ENV 'staging'

# -------------------------------------------- 
# PATH
# -------------------------------------------- 

set -xg PATH /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /usr/local/bin /opt/X11/bin
set -xg PATH /Users/steve/src/go/bin /usr/local/sbin $PATH
set -xg PATH /usr/local/share/npm/bin $PATH

### Added by the Heroku Toolbelt
set -xg PATH /usr/local/heroku/bin $PATH

# -------------------------------------------- 
# RBENV
# -------------------------------------------- 

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# -------------------------------------------- 
# PLUGINS
# Taken from : https://github.com/terlar/dotfiles/blob/master/fish/config/fish/config.fish
# -------------------------------------------- 

set -l plugins_path ~/.config/fish/plugins
# Bundler
. $plugins_path/bundler/bundler.fish
# node_modules
. $plugins_path/node_modules/node_modules.fish

# -------------------------------------------- 
# FUNCTIONS
# --------------------------------------------

# Reload all functions
for fish_file in ~/.config/fish/functions/*
  . $fish_file
end
for fish_file in ~/.config/fish/private/*
  . $fish_file
end