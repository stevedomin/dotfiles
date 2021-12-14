function fish_prompt --description 'Write out the prompt'
  set -g __fish_git_prompt_showupstream auto
  set -g __fish_git_prompt_showdirtystate
  printf '%s%s%s%s %s$%s %s' (set_color -o $fish_color_cwd) (prompt_pwd) (set_color red) (fish_git_prompt) (set_color -o $fish_color_cwd) (set_color normal) (set_color normal)
end
