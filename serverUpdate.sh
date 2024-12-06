#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root. Re-running with sudo..."
  sudo "$0" "$@"  # Re-run the script with sudo and pass all arguments
  exit 1
fi

cd /home/tyler/Desktop/

# Your script logic goes here
echo "Running as root!"

bash Fabric_Minecraft_Server/serverStop.sh

yes | sudo cp -r Fabric_Minecraft_Server /Old_Fabric_Minecraft_Server
yes | sudo rm -r Fabric_Minecraft_Server

mkdir Fabric_Minecraft_Server
java -jar fabric-installer-1.0.1.jar server -downloadMinecraft -dir Fabric_Minecraft_Server/

sudo bash -c '
for file in $(echo -e "banned-ips.json\nserverStart.sh\nbanned-players.json\nserverStatus.sh\nops.json\neula.txt\nserver-icon.png\nusercache.json\n\server.properties\nwhitelist.json\nserverSave.sh\nworld"); do
    echo "Copying $file..."
    yes | cp -r "Old_Fabric_Minecraft_Server/$file" "Fabric_Minecraft_Server/$file"
done
'

echo "Finished copying files..."