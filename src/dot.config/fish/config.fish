set fish_greeting

source ~/.config/fish/aliases.fish

# --------------------------------------------
# ENV
# --------------------------------------------

set -xg EDITOR 'nvim'

set -xg GPG_TTY (tty)

set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8

set -xg ERL_AFLAGS '-kernel shell_history enabled'

set -xg FZF_DEFAULT_COMMAND 'ag -l --nocolor --hidden --ignore .git -g ""'

# --------------------------------------------
# PATH
# --------------------------------------------

set -xg PATH /usr/bin /bin /usr/sbin /sbin $PATH
set -xg PATH /opt/homebrew/bin $PATH
set -xg PATH $HOME/bin $PATH
set -xg PATH $HOME/code/google-cloud-sdk/bin $PATH

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
