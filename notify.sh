#!/bin/bash

TARGET_URL="https://notify.kitty.software/bgp_down"
FAILURE_MESSAGE="Core edge router is offline, fix it you big cocker fuck."

send_notification() {
  curl -d "$FAILURE_MESSAGE" "$TARGET_URL"
}

while true; do
  if ping -c 1 23.142.248.1 >/dev/null 2>&1; then
    echo "Ping successful at $(date)"
  else
    echo "Ping failed at $(date)"
    send_notification
  fi
  sleep 60 
done
