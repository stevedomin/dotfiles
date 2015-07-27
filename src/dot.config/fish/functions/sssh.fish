function sssh
  sknife ssh -C 10 -x sdomin -a softlayer.private_ip --ssh-port 61315 $argv
end
