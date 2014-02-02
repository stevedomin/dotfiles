function sdatabag
  set KNIFE_ENV 'staging'
  command knife data bag --secret-file ~/.chef/gocardless/staging/encrypted_data_bag_secret $argv
end
