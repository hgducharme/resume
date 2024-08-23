#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure that the script is run using the git folder in this project directory
GIT='git --git-dir='$PWD'/.git'

# Update the engineering branch with updates
echo "\nUpdating engineering branch..."
$GIT checkout engineering
$GIT merge main --no-edit
$GIT push

# Update the fire-ems branch with updates
echo "\nUpdating fire-ems branch..."
$GIT checkout fire-ems
$GIT merge main --no-edit
$GIT push

# Update the oddjobs branch with updates
echo "\nUpdating oddjobs branch..."
$GIT checkout oddjobs
$GIT merge main --no-edit
$GIT push

echo "\nComplete! Switching back to main..."
$GIT checkout main