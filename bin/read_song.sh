#!/usr/bin/env bash
(head -1 /tmp/current_song || echo -n " --- ") | cut -c1-72

