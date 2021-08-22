#!/bin/bash

git log "$(git rev-list -n 1 "$1")"
