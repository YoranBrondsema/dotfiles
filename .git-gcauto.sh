#!/bin/bash
if git diff --cached --quiet; then
  echo "No staged changes to commit"
  exit 1
fi

echo "Generating commit message..."
MSG=$(claude -p "Look at the staged git changes and create a summarizing git commit title. Only respond with the title and no affirmation." 2>/dev/null)

if [ $? -eq 0 ] && [ -n "$MSG" ]; then
  echo "Generated message: $MSG"
  git commit -m "$MSG"
else
  echo "Failed to generate commit message, opening editor..."
  git commit
fi
