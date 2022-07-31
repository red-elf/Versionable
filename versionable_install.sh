#!/bin/bash
if [ -z "$1" ]; then

  echo "ERROR: The target parameter has not been provided"
  exit 1
fi

TARGET="$1"

echo "Please provide your SUDO password in order to install the '$TARGET' target to your system" && \
cd "$TARGET/Build" &&
sudo ninja install && \
echo "The '$TARGET' target has been installed with success"
