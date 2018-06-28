#!/usr/bin/env bash
# Script to clone a repo.
# Usage: clone_repo.sh (repo_url) (args...)
set -e
type git >/dev/null
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
REPO=$1
DIR="$(basename "$REPO")"
[ ! "$REPO" ] && { echo "Usage: $0 (git@repo/url)"; exit 1; }

[ ! -d "$DIR" ] && git clone $* -q -b master --recursive --single-branch --depth 1
cd "$DIR" && git fetch origin && git status && git reset origin/master --hard
