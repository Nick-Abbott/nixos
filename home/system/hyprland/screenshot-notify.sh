#!/usr/bin/env bash

# Usage: screenshot-notify.sh <image_path> <title> <message>

IMAGE="$1"
TITLE="$2"
MESSAGE="$3"

# Send notification with action and larger icon hint
# The image-path hint is used by some notification daemons for larger previews
# Run in background but keep the action handler in foreground
(
  ACTION=$(notify-send "$TITLE" "$MESSAGE" \
    --icon="$IMAGE" \
    --hint=string:image-path:"$IMAGE" \
    --action="open=Open Image" \
    --wait)
  
  if [ "$ACTION" = "open" ]; then
    xdg-open "$IMAGE"
  fi
) &
