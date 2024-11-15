#!/usr/bin/python3

from mcrcon import MCRcon
import time

# RCON Credentials
RCON_HOST="127.0.0.1"
RCON_PORT=1234
RCON_PASSWORD="password"
# Send a command via RCON
with MCRcon(RCON_HOST, RCON_PASSWORD, RCON_PORT) as mcr:
                resp = mcr.command("say the server is stopping in 10 seconds")
                print(resp)
                time.sleep(10)
                resp = mcr.command("save-all")
                print(resp)
                resp = mcr.command("stop")
                print(resp)