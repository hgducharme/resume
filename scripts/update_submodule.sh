#!/bin/bash

# This script will iterate through all branches in the main repository and will update the branch to point to the latest version of the submodule.

path_to_submodule="../components"

# Store the current branch name
current_branch=$(git branch --show-current)

# Fetch all branches from the remote
git fetch --all

# Loop through each branch
for branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
    echo "\nUpdating submodule in branch $branch..."

    # Checkout the branch
    git checkout $branch

    # Update the submodule reference
    git submodule update --remote --merge

    # Stage the updated submodule reference
    git add $path_to_submodule

    # Commit the change
    git commit -m "Updated submodule in branch $branch"

    # Push the change to the remote (optional)
    git push origin $branch
done

# Checkout back to the original branch
git checkout $current_branch
