function pknife
  set KNIFE_ENV 'production'
  command knife $argv
  # this returns the environment back to staging
  # after knife command is run in production
  set KNIFE_ENV 'staging'
end
