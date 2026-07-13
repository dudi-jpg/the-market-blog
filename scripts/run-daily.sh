#!/bin/bash
# Daily article run for The Market — invoked by launchd (see ~/Library/LaunchAgents/com.themarket.daily.plist).
# Generates ARTICLES_PER_RUN articles, commits, and pushes (Cloudflare auto-deploys).
# The API key is read from a local, git-ignored file — never stored in the repo.
set -euo pipefail

export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
REPO="$HOME/Projects/landing/the-market"
KEY_FILE="$HOME/.config/the-market/anthropic.key"

cd "$REPO"
export ANTHROPIC_API_KEY="$(cat "$KEY_FILE")"
export ARTICLES_PER_RUN="${ARTICLES_PER_RUN:-10}"

echo "=== $(date '+%Y-%m-%d %H:%M:%S') — generating $ARTICLES_PER_RUN articles ==="
node scripts/generate-daily.mjs

git add -A
if git diff --cached --quiet; then
  echo "No new articles to commit."
else
  git -c user.name="The Market Bot" -c user.email="info@the-market.co.il" \
    commit -m "Daily articles — $(date -u +%Y-%m-%d)"
  git push origin main
  echo "Pushed new articles."
fi
