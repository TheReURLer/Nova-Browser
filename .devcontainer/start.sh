#!/bin/bash

# Start virtual display
Xvfb :1 -screen 0 1920x1080x24 &
export DISPLAY=:1

# Start VNC server
x11vnc -display :1 -nopw -forever -shared &

# Start noVNC
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

# Wait a few seconds for desktop to stabilize
sleep 5

# Launch Microsoft Edge
microsoft-edge-stable &
