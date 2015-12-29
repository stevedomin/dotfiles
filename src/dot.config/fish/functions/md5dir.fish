function md5dir
  find $argv -type f -exec md5 \{\} + | awk '{print $NF}' | sort -k 34 | md5
end
