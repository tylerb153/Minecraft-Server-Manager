#!/bin/bash
if ! pgrep -f "java -Xmx12G -jar fabric-server-launch.jar nogui" >/dev/null; then
    echo "Starting server"
    # java -Xmx12G -jar fabric-server-launch.jar nogui
else 
    echo "Server already running"
fi

