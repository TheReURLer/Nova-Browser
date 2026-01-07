#!/bin/bash
set -e

export DISPLAY=:1

echo "Starting Xvfb..."
Xvfb :1 -screen 0 1920x1080x24 &

sleep 1

echo "Starting x11vnc..."
x11vnc -display :1 -nopw -forever -shared -noxdamage &

sleep 1

echo "Starting noVNC via websockify..."
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

sleep 1

echo "Launching Microsoft Edge..."
microsoft-edge-stable --no-sandbox --disable-dev-shm-usage --start-maximized &

wait

