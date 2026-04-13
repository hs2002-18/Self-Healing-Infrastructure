#!/bin/bash

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000)

if [ "$STATUS" != "200" ]; then
  exit 1
fi