#!/bin/bash

# Start the X virtual framebuffer (Xvfb) with a high resolution
echo "Starting Xvfb..."
Xvfb :0 -screen 0 640x480x16 &
#1920x1080x16 &
XVFB_PID=$!

# Wait for Xvfb to initialize
sleep 2

# Start DOSBox in the background
echo "Starting DOSBox..."
DISPLAY=:0 dosbox &

# Start the VNC server (x11vnc)
echo "Starting x11vnc..."
x11vnc -forever -usepw -display :0 -rfbport 5900 &
VNC_PID=$!

# Start the noVNC server
echo "Starting noVNC..."
websockify --web=/opt/novnc 8082 localhost:5900 &
NOVNC_PID=$!

# Wait for processes to stabilize
sleep 2

# Keep the container running
wait $XVFB_PID $VNC_PID $NOVNC_PID
