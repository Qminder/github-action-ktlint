#!/usr/bin/env bash

cd "$GITHUB_WORKSPACE" || exit 1

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

ktlint --reporter=checkstyle --relative \
  | reviewdog -f=checkstyle -name="ktlint" -reporter=github-pr-check -filter-mode=added -level=error
