#!/bin/bash

touch /tmp/cron-worked-test

gitDirs=("${HOME}/Lab/git/vimwiki" "${HOME}/Lab/git/dot-files" \
  "${HOME}/.config/herbstluftwm")

function gitSync() {
    cd $dir
    echo "--> git pull"
    git pull
    git add .
    git commit -a -m "git-sync-cron"
    echo "--> git push"
    git push
}

for dir in ${gitDirs[@]}; do
  echo -e "\n$dir"
  if [ -d $dir ]; then
   gitSync $dir
  fi
done

