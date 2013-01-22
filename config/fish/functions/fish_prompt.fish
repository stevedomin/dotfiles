# Port of __git_ps1 for Fish shell (tested with FishFish)
#--------------------------------------------------------------------------------------------------
# https://github.com/bjeanes/dot-files/tree/294254ce2f064bbfc586e98107da1ed510898ffd/fish/functions
# via @bjeanes - https://github.com/bjeanes

function __git_ps1
  set -l git (git rev-parse --git-dir ^/dev/null)
  if [ -n "$git" ]
    set -l r ""
    set -l b ""

    if [ -d "$git/../.dotest" ]
      if [ -f "$git/../.dotest/rebasing" ]
        set r "|REBASE"
      elseif [ -f "$git/../.dotest/applying" ]
        set r "|AM"
      else
        set r "|AM/REBASE"
      end

      set b (git symbolic-ref HEAD ^/dev/null)
    elseif [ -f "$git/.dotest-merge/interactive" ]
      set r "|REBASE-i"
      set b (cat "$git/.dotest-merge/head-name")
    elseif [ -d "$git/.dotest-merge" ]
      set r "|REBASE-m"
      set b (cat "$git/.dotest-merge/head-name")
    elseif [ -f "$git/MERGE_HEAD" ]
      set r "|MERGING"
      set b (git symbolic-ref HEAD ^/dev/null)
    else
      if [ -f "$git/BISECT_LOG" ]
        set r "|BISECTING"
      end

      set b (git symbolic-ref HEAD ^/dev/null)
      if [ -z $b ]
        set b (git describe --exact-match HEAD ^/dev/null)
        if [ -z $b ]
          set b (cut -c1-7 "$git/HEAD")
          set b "$b..."
        end
      end
    end

    if not test $argv
        set argv " (%s)"
    end

    set b (echo $b | sed -e 's|^refs/heads/||')

    printf $argv "$b$r" ^/dev/null
  end
end

function git_dirty
  if not is_git_repo
    return 1
  end
  not git diff HEAD --quiet ^/dev/null
end

function is_git_repo
  git status >/dev/null ^/dev/null
  not test $status -eq 128
end

function fish_prompt --description 'Write out the prompt'
  #printf '%s%s@%s%s ' (set_color green) (whoami) (hostname|cut -d . -f 1) (set_color normal) 
 
  # Write the process workingit directory
  if test -w "."
    printf '%s%s' (set_color -o $fish_color_cwd) (prompt_pwd)
  else
    printf '%s%s' (set_color -o $fish_color_uneditable_cwd) (prompt_pwd)
  end

  printf '%s%s ' (set_color red) (__git_ps1)

  if git_dirty
    printf '%s✮ ' (set_color -o green)
  end
 
  printf '%s$%s ' (set_color -o $fish_color_cwd) (set_color normal)
 
  printf '%s> ' (set_color normal)
end
