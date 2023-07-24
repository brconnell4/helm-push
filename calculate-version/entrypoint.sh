#!/bin/bash -l

# Exit immediately if a command exits with a non-zero status
set -e

# Echoes all commands before executing.
set -v

# Determine the version using GitVersion
GITVERSION_JSON=$(gitversion /output json /showvariable NuGetVersionV2)
echo "$GITVERSION_JSON"

# Extract branch name from Github environment variable
BRANCH_NAME=$(echo "$GITHUB_HEAD_REF" | sed 's/features\///')
echo "$BRANCH_NAME"


# Determine if prod flag is true
if [ "$1" == "true" ]; then
    echo "$GITVERSION_JSON" > .tags
else
    echo "$GITVERSION_JSON-$BRANCH_NAME.$GITVERSION_PRERELEASENUMBER" > .tags
fi