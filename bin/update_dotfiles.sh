#!/usr/bin/env bash

set -e 
git_push() {
    git add .
    git commit -am"[Automated commit] pushing changes"
    git push origin master
}

trap git_push EXIT
