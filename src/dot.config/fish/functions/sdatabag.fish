function sdatabag
  set KNIFE_ENV 'staging'
  if not contains 'list' $argv
    command knife data bag --secret-file ~/.chef/gocardless/staging/encrypted_data_bag_secret $argv
  else
    command knife data bag $argv  
  end
end
