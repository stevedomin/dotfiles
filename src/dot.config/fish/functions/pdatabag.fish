function pdatabag
  set KNIFE_ENV 'production'
  if not contains 'list' $argv
    command knife data bag --secret-file ~/.chef/gocardless/production/encrypted_data_bag_secret $argv
  else
    command knife data bag $argv  
  end
  set KNIFE_ENV 'staging'
end
