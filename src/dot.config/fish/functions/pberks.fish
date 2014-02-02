function pberks
  set KNIFE_ENV 'production'
  command berks $argv -c $CODEPATH/gc/chef-repo/cookbooks/.berkshelf/config-production.json
  set KNIFE_ENV 'staging'
end
