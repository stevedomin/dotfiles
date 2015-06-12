function pdatabag
  set KNIFE_ENV 'production'
  command knife data bag $argv  
  set KNIFE_ENV 'staging'
end
