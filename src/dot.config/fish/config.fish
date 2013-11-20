set fish_greeting

# --------------------------------------------
# ENV
# --------------------------------------------

set -xg EDITOR vim
set -xg GOPATH /Users/steve/src/go
set -xg KNIFE_ENV 'staging'
set -xg PKG_CONFIG_PATH /usr/local/Cellar/sqlite/3.7.17/lib/pkgconfig/

# --------------------------------------------
# PATH
# --------------------------------------------

set -xg PATH /usr/bin /bin /usr/sbin /sbin /opt/X11/bin
set -xg PATH /Users/steve/src/go/bin /usr/local/bin /usr/local/sbin $PATH
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
# PRIVATE
# --------------------------------------------

for fish_file in ~/.config/fish/private/*
  . $fish_file
end

# --------------------------------------------
# PROJECTS
# --------------------------------------------

eval functions|grep ,|functions -e xargs
set PROJECTS_PATH $HOME/src $HOME/src/gc $HOME/src/go/src/github.com/stevedomin $HOME/src/go/src/github.com/gocardless

for project_path in $PROJECTS_PATH
  for project in $project_path/*
    if test -d $project
      set name (basename $project)
      eval "function ,{$name} ; cd {$project}; end"
    end
  end
end

set -e PROJECTS_PATH
set -e project
