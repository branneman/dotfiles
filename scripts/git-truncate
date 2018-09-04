#!/bin/bash

git checkout --orphan temp $1
git commit -m "Truncated history"
git rebase --onto temp $1 master
git branch -D temp
