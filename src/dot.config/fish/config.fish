set fish_greeting

# --------------------------------------------
# ENV
# --------------------------------------------

set -xg EDITOR 'vim'

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
set -xg PATH /usr/local/share/npm/bin $PATH
set -xg PATH $HOME/src/go/bin $PATH
set -xg PATH $GOBIN $PATH

# --------------------------------------------
# ALIASES
# --------------------------------------------

alias ldatabag "lknife data bag $argv"
alias pdatabag "pknife data bag $argv"
alias sdatabag "sknife data bag $argv"

alias lssh "lknife ssh -C 10 -x sdomin -a softlayer.private_ip --ssh-port 61315 $argv"
alias pssh "pknife ssh -C 10 -x sdomin -a softlayer.private_ip --ssh-port 61315 $argv"
alias sssh "sknife ssh -C 10 -x sdomin -a softlayer.private_ip --ssh-port 61315 $argv"

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
set PROJECTS_PATH $HOME/src $HOME/src/github.com/stevedomin $HOME/src/github.com/gocardless

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
