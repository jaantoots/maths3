#!/bin/bash

git diff-index --quiet --cached HEAD \
    || { echo "fatal: Index is dirty" 1>&2; exit 1; }

dir=$(dirname "$0")
name=$(git rev-list -1 HEAD)
build="$dir/_build/$name"

find "$dir" -type f -name ".DS_Store" -delete

echo "Build website..." 1>&2
mkdir -p "$build"
harp compile "$dir" "$build"

echo "Write to repository..." 1>&2
git add -f "$build"
tree=$(git write-tree --prefix="_build/$name")
parent=$(git rev-list -1 gh-pages)
commit=$(git commit-tree -p "$parent" -m "Build website $name" "$tree")
git branch -f gh-pages "$commit"

echo "Cleaning up..." 1>&2
git reset
