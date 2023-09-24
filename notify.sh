#!/bin/bash

TARGET_HOSTS=("core.as393577.net" "kc.ix.as393577.net" "kc02.ix.as393577.net" "ams.ix.as393577.net" "sj.ix.as393577.net")
TARGET_URL="https://notify.kitty.software/bgp_down"

send_notification() {
  local hostname="$1"
  local current_time="$(date)"
  local message="Edge router $hostname is offline at $current_time. Fix it you small cock femboy fuck."
  curl -d "$message" "$TARGET_URL"
}

while true; do
  for host in "${TARGET_HOSTS[@]}"; do
    if ping -c 1 "$host" >/dev/null 2>&1; then
      echo "Ping to $host successful at $(date)"
    else
      echo "Ping to $host failed at $(date)"
      send_notification "$host"
    fi
  done
  sleep 60
done
