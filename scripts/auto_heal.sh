#!/bin/bash

CONTAINER_NAME="my-app"

while true; do
  if ! docker ps | grep $CONTAINER_NAME > /dev/null; then
    echo "$(date) - Container down! Restarting..." >> heal.log
    docker start $CONTAINER_NAME
  fi
  sleep 10
done