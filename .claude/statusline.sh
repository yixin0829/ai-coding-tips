#!/bin/bash
# Read JSON input from stdin
input=$(cat)

# Extract values using jq
MODEL_DISPLAY=$(echo "$input" | jq -r '.model.display_name')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir')
USED_PERCENT=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
USED_TOKENS=$(echo "$input" | jq -r '.context_window.used_tokens // empty')
TOTAL_TOKENS=$(echo "$input" | jq -r '.context_window.total_tokens // empty')

# Show git branch if in a git repo (use -C to run git in the workspace directory)
GIT_BRANCH=""
if git -C "$CURRENT_DIR" rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git --no-optional-locks -C "$CURRENT_DIR" branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        GIT_BRANCH=" | 🌿 $BRANCH"
    fi
fi

CONTEXT_USAGE=""
if [ -n "$USED_TOKENS" ] && [ -n "$TOTAL_TOKENS" ] && [ -n "$USED_PERCENT" ]; then
    USED_K=$((USED_TOKENS / 1000))
    TOTAL_K=$((TOTAL_TOKENS / 1000))
    CONTEXT_USAGE=" | 🧠 ${USED_K}k/${TOTAL_K}k (${USED_PERCENT}%)"
elif [ -n "$USED_PERCENT" ]; then
    CONTEXT_USAGE=" | 🧠 ${USED_PERCENT}%"
fi

echo "[$MODEL_DISPLAY] 📁 ${CURRENT_DIR##*/}$GIT_BRANCH$CONTEXT_USAGE"
