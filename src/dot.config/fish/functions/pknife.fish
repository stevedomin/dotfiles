function pknife
  set KNIFE_ENV 'production'
  /Users/steve/src/github.com/gocardless/chef-repo/.bundle/binstubs/knife $argv
  set KNIFE_ENV 'staging'
end
