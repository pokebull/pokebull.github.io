#! /bin/sh
if ! command -v git > /dev/null; then
   echo git not found
   exit 1
fi
cd "$(dirname "$0")"
git fetch origin
git add .
if [ "$(git diff HEAD)" ]; then
    git commit -a -m "$(date '+%Y-%m-%d %H:%M:%S') $*"
fi
git fetch origin
if ! git rebase; then
    git rebase --abort
    exit 1
fi
git push origin
