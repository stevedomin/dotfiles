set fish_greeting

. ~/.config/fish/aliases.fish

# --------------------------------------------
# ENV
# --------------------------------------------

set -xg EDITOR 'nvim'

set -xg KNIFE_ENV 'staging'
set -xg DOCKER_HOST tcp://dev.vm:2375

set -xg GOPATH $HOME
set -xg GOBIN $GOPATH/bin
set -xg GPG_TTY (tty)

set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8

# --------------------------------------------
# PATH
# --------------------------------------------

set -xg PATH /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $PATH
set -xg PATH /usr/local/bin $PATH
set -xg PATH $HOME/src/google-cloud-sdk/bin $PATH
set -xg PATH /usr/local/share/npm/bin $PATH
set -xg PATH /usr/local/opt/go/libexec/bin $PATH
set -xg PATH $GOBIN $PATH

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
source $plugins_path/bundler/bundler.fish
# node_modules
source $plugins_path/node_modules/node_modules.fish
# z
source $plugins_path/z/z.fish


# --------------------------------------------
# PRIVATE
# --------------------------------------------

for fish_file in ~/.config/fish/private/*
  . $fish_file
end

