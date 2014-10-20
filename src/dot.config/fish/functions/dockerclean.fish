function dockerclean
  for i in (docker $argv ps -a | grep 'Exit')
    docker $argv rm (echo $i | awk '{print $1}')
  end
end
