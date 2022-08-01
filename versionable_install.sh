#!/bin/bash
if [ -z "$1" ]; then

  echo "ERROR: The target parameter has not been provided"
  exit 1
fi

HERE="$(pwd)"
TARGET="$1"
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
source "$VERSION_SCRIPT" && \
  echo "Please provide your SUDO password in order to install the '$VERSIONABLE_NAME' target to your system" && \
  cd "$TARGET/Build" && \
  sudo ninja install && \
  echo "The '$VERSIONABLE_NAME' target has been installed with success"
