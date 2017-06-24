set fish_greeting

source ~/.config/fish/aliases.fish

# --------------------------------------------
# ENV
# --------------------------------------------

set -xg EDITOR 'nvim'

set -xg KNIFE_ENV 'staging'
#set -xg DOCKER_HOST tcp://dev.vm:2375

set -xg GOPATH $HOME
set -xg GOBIN $GOPATH/bin
set -xg GPG_TTY (tty)

set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8

set -xg CUDA_HOME /usr/local/cuda
set -xg DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH $CUDA_HOME/lib

set -xg ERL_AFLAGS '-kernel shell_history enabled'

# --------------------------------------------
# PATH
# --------------------------------------------

set -xg PATH /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $PATH
set -xg PATH /usr/local/bin $PATH
set -xg PATH $HOME/src/google-cloud-sdk/bin $PATH
set -xg PATH $HOME/.npm-packages/bin $PATH
set -xg PATH /usr/local/opt/go/libexec/bin $PATH
set -xg PATH $GOBIN $PATH
set -xg PATH $CUDA_HOME/bin $PATH

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

