set fish_greeting

source ~/.config/fish/aliases.fish

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
set -xg PATH $HOME/.npm-packages/bin $PATH
set -xg PATH /usr/local/opt/go/libexec/bin $PATH
set -xg PATH $GOBIN $PATH

# --------------------------------------------
# PLUGINS
# Taken from : https://github.com/terlar/dotfiles/blob/master/fish/config/fish/config.fish
# --------------------------------------------

set -l plugins_path ~/.config/fish/plugins
# rbenv
source $plugins_path/rbenv/rbenv.fish
# Bundler
source $plugins_path/bundler/bundler.fish
# node
source $plugins_path/node/node.fish
# z
source $plugins_path/z/z.fish


# --------------------------------------------
# PRIVATE
# --------------------------------------------

for fish_file in ~/.config/fish/private/*
  source $fish_file
end

