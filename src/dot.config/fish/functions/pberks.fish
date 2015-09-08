function pberks
  set KNIFE_ENV 'production'
  command berks $argv
  set KNIFE_ENV 'staging'
end
