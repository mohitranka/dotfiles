#!/usr/bin/env bash

maildirs="$HOME/.mutt/cache/bodies/*/INBOX"

find $maildirs -type f | wc -l | awk '{$1=$1};1'
