function lknife
  set KNIFE_ENV 'lab'
  command knife $argv
  # this returns the environment back to staging
  # after knife command is run in lab
  set KNIFE_ENV 'staging'
end
