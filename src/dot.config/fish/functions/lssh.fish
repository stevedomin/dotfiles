function lssh
  lknife ssh -C 10 -x steve -a softlayer.private_ip --ssh-port 61315 $argv
end
