#!/usr/bin/env bash

firefox &
PID=$!

while [ ! -d ~/.mozilla/firefox ]; do
  sleep 0.2
done

kill $PID
