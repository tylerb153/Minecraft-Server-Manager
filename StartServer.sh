#!/bin/bash
if ! pgrep -f "java -Xmx12G -jar server.jar nogui" >/dev/null; then
    echo "Starting server"
    # java -Xmx12G -jar server.jar nogui &
fi

