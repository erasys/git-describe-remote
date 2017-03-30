# git describe remote
Finds the latest semantic version tag that is referenced by the given branch.

It runs `git describe --abbrev=0 --tags --match "*.*.*" $BRANCH` on a given remote URL.

## Usage
```
docker build -t git_describe_remote .
docker run -it -v $HOME/.ssh/:/root/.ssh/ -v git_describe_remote_cache:/repos git_describe_remote $REMOTE_URL $BRANCH
```
