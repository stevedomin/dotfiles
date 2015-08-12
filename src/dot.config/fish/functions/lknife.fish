function lknife
  set KNIFE_ENV 'lab'
  /Users/steve/src/github.com/gocardless/chef-repo/.bundle/binstubs/knife $argv
  set KNIFE_ENV 'staging'
end
