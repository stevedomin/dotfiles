function pdatabag
  set KNIFE_ENV 'production'
  command knife data bag --secret-file ~/.chef/gocardless/production/encrypted_data_bag_secret $argv
  set KNIFE_ENV 'staging'
end
