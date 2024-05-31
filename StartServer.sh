#!/bin/bash
if ! pgrep -f "java -Xmx12G -jar fabric-server-launch.jar nogui" >/dev/null; then
    echo "Starting server"
    (cd ~/"Desktop/Modded Minecraft Server" && exec java -Xmx12G -jar fabric-server-launch.jar nogui) &
else 
    echo "Server already running"
fi

