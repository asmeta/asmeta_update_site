#!/usr/bin/env bash

# Entry-point script for launching Asmeta inside a VNC environment with noVNC access.
# - Sets up user environment
# - Configures VNC
# - Starts web access via noVNC
# - Launches 

set -e

cd /artifact

USER="asmeta"
HOME="/home/asmeta"

export USER LOGNAME="$USER" HOME DISPLAY=":1"

# Set VNC password to 'asmeta'
mkdir -p "$HOME/.vnc"
echo "asmeta" | vncpasswd -f > "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

# Start VNC (resolution via VNC_GEOMETRY, scaling via GDK_SCALE)
export GDK_SCALE="${GDK_SCALE:-1}"
export VNC_GEOMETRY="${VNC_GEOMETRY:-2560x1600}"
vncserver :1 -geometry "$VNC_GEOMETRY" -depth 24 -localhost

# Start noVNC/websockify
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &
WEBSOCKIFY_PID=$!

# Launch Asmeta
bash /artifact/asmeta_linux64.sh &

# Open readme
evince /artifact/README.pdf &

# Open artifact directory
thunar /artifact &

echo "----------------"
echo "Open: http://localhost:6080/vnc.html?resize=scale"
echo "Password: asmeta"
echo "----------------"
echo " "

cleanup() {
  echo "Stopping..."
  kill "$WEBSOCKIFY_PID" 2>/dev/null || true
  vncserver -kill :1 2>/dev/null || true
}

trap cleanup SIGINT SIGTERM

wait "$WEBSOCKIFY_PID"
cleanup