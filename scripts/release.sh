#!/usr/bin/env bash
# Release a new SDK version: bumps sdkVersion, commits, tags, and pushes.
# Usage: ./scripts/release.sh 1.0.152
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: $0 <version>   e.g. $0 1.0.152"
  exit 1
fi

VERSION="$1"
FILE="PopinCall/Core/Popin.swift"
BRANCH="main"

# Validate semver-ish format
if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "error: version must be X.Y.Z (got '$VERSION')"
  exit 1
fi

cd "$(git rev-parse --show-toplevel)"

# Refuse if tag already exists locally or remotely
if git rev-parse "$VERSION" >/dev/null 2>&1; then
  echo "error: tag $VERSION already exists locally"
  exit 1
fi
if git ls-remote --tags origin "refs/tags/$VERSION" | grep -q "$VERSION"; then
  echo "error: tag $VERSION already exists on origin"
  exit 1
fi

# Refuse on wrong branch
CURRENT=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT" != "$BRANCH" ]; then
  echo "error: must be on $BRANCH (currently on $CURRENT)"
  exit 1
fi

# Refuse if working tree has unrelated changes
if ! git diff --quiet -- ":!$FILE" || ! git diff --cached --quiet; then
  echo "error: working tree has uncommitted changes outside $FILE"
  git status --short
  exit 1
fi

# BSD sed (macOS) form: -i '' for in-place without backup
sed -i '' "s/sdkVersion = \"[^\"]*\"/sdkVersion = \"$VERSION\"/" "$FILE"

if git diff --quiet "$FILE"; then
  echo "error: sdkVersion in $FILE was already $VERSION (nothing to commit)"
  exit 1
fi

git add "$FILE"
git commit -m "Bump SDK version to $VERSION"
git push origin "$BRANCH"
git tag "$VERSION"
git push origin "$VERSION"

echo "released $VERSION"
