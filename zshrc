# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steved"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby bundler node npm)

autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^Z'   predict-on
bindkey '^X^Z' predict-off
zstyle ':predict' verbose true
setopt interactivecomments

source $ZSH/oh-my-zsh.sh

for file in $HOME/.zsh/*; do
    if [[ $file != $0 ]]; then
        source $file
    fi
done

PROJECTS_PATH="$HOME/src"
GC_PROJECTS_PATH="$HOME/src/gc"
for project in `ls $PROJECTS_PATH`; do
  if [ -d $PROJECTS_PATH/$project ]; then
    eval "function ,$project { cd $PROJECTS_PATH/$project }"
  fi
done
for project in `ls $GC_PROJECTS_PATH`; do
  if [ -d $GC_PROJECTS_PATH/$project ]; then
    eval "function ,$project { cd $GC_PROJECTS_PATH/$project }"
  fi
done
unset project

# rbenv
eval "$(rbenv init -)"

