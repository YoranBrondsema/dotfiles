#!/usr/bin/env bash

# Delete local branches that have been merged (including via rebase/squash)
git fetch -p

# Determine the main branch
main_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo 'master')

# Iterate through all local branches except master/main
for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/ | grep -vE '^(master|main)$'); do
  # Check if remote branch exists
  if ! git show-ref --verify --quiet refs/remotes/origin/$branch; then
    # Remote doesn't exist - check if commits were merged using git cherry
    # (detects rebased/squashed commits by comparing patch content, not SHA)
    unique=$(git cherry $main_branch $branch 2>/dev/null | grep -c '^+')
    # grep -c always outputs a count, even if 0, so no fallback needed

    if [ "$unique" = "0" ]; then
      echo "Deleting $branch (no remote, all commits merged)"
      git branch -D $branch
    else
      echo "Preserving $branch ($unique unpushed commits)"
    fi
  else
    # Remote exists - check if branch is ancestor of main
    if git merge-base --is-ancestor $branch origin/$main_branch 2>/dev/null; then
      echo "Deleting $branch (merged to remote)"
      git branch -d $branch
    fi
  fi
done
