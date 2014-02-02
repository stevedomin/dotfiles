function sberks
  set KNIFE_ENV 'staging'
  command berks $argv -c $CODEPATH/gc/chef-repo/cookbooks/.berkshelf/config-staging.json
end
