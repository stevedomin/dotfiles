# -------------------------------------------- 
# PROJECTS
# -------------------------------------------- 

set PROJECTS_PATH $HOME/src
set GC_PROJECTS_PATH $HOME/src/gc

for project in $PROJECTS_PATH/*
  if test -d $project
    set name (basename $project)
    eval "function ,{$name} ; cd {$project}; end"
  end
end
for project in $GC_PROJECTS_PATH/*
  if test -d $project
    set name (basename $project)
    eval "function ,{$name} ; cd {$project}; end"
  end
end

set -e PROJECTS_PATH
set -e GC_PROJECTS_PATH
set -e project
