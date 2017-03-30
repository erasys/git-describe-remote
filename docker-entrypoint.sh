#!/bin/sh
set -eu

REPOSITORY_URL=$1
BRANCH=$2

# Create local repo folders like this:
# git@github.com:erasys/git-describe-remote.git
# git-github-com-erasys/git-describe-remote-git
REPO_PATH="/repos/$(echo ${REPOSITORY_URL} | sed 's/[^a-zA-Z0-9]/-/g')"

# Do the initial clone if we need to
if ! [ -d ${REPO_PATH} ] ; then
  git clone -q --bare ${REPOSITORY_URL} ${REPO_PATH}
else
  git --git-dir=${REPO_PATH} fetch -q
fi

git --git-dir=${REPO_PATH} describe --abbrev=0 --tags --match "*.*.*" ${BRANCH}
