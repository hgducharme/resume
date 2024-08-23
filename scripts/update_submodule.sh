#!/bin/bash

# This script will iterate through all branches in the main repository and will update the branch to point to the latest version of the submodule.

# Store the current branch name
current_branch=$(git branch --show-current)

# Fetch all branches from the remote
git fetch --all

# Loop through each branch
for branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
    echo
    echo "Updating submodule in branch $branch..."

    # Checkout the branch
    git checkout $branch

    # Update the submodule reference
    git submodule update

    # Stage the updated submodule reference
    git add components

    # Commit the change
    git commit -m "Updated submodule in branch $branch"

    # Push the change to the remote (optional)
    git push origin $branch
done

# Checkout back to the original branch
git checkout $current_branch
