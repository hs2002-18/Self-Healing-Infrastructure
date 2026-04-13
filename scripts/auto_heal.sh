#!/bin/bash

while true
do
  ./health_check.sh

  if [ $? -ne 0 ]; then
    echo "Restarting container..."
    docker restart my-app
  fi

  sleep 10
done