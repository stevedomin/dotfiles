function pknife
  set KNIFE_ENV 'production'
  knife $argv
  # this returns the environment back to staging
  # after knife command is run in production
  set KNIFE_ENV 'staging'
end
 
function sknife
  set KNIFE_ENV 'staging'
  knife $argv
end
