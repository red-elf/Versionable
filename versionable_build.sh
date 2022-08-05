#!/bin/bash

if [ -z "$1" ]; then

  echo "ERROR: The target parameter has not been provided"
  exit 1
fi

if [ -z "$2" ]; then

  echo "ERROR: The CMakeLists.txt directory path parameter has not been provided"
  exit 1
fi

HERE="$(pwd)"
TARGET="$1"
CMAKE_PATH="$2"
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  echo "Installing the '$VERSIONABLE_NAME' target, please wait" && \
  cd "$TARGET" && \
  rm -rf ./Build && \
  mkdir Build && \
  cd Build && \
  . "$VERSION_SCRIPT" && cmake -GNinja -DVERSIONABLE_VERSION_PRIMARY="$VERSIONABLE_VERSION_PRIMARY" \
  -DVERSIONABLE_VERSION_SECONDARY="$VERSIONABLE_VERSION_SECONDARY" -DVERSIONABLE_NAME="$VERSIONABLE_NAME" \
  -DVERSIONABLE_VERSION_PATCH="$VERSIONABLE_VERSION_PATCH" -DVERSIONABLE_SNAPSHOT="$VERSIONABLE_SNAPSHOT" \
  "$CMAKE_PATH" && \
  ninja -j "$(nproc)" && \
  echo "The '$VERSIONABLE_NAME' target has been compiled with success"
