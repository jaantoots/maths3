#!/bin/bash

maths3=$(dirname "$0")
cd "$maths3" || exit

./get_examples.rb

cd "_local" || exit

test -z "$(git status --porcelain)" || {
    git add .;
    git commit -m "Update $(date "+%Y-%m-%d")";
}
