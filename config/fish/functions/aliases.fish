# Go pprof alias
function gopprof
  go tool pprof $argv
end

# Git
function g
  git $argv
end

function chromedev
  /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary \
--js-flags="--trace-opt --trace-deopt --trace-bailout" --allow-file-access --remote-debugging-port=9222
end
