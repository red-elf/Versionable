#!/bin/bash

HERE="$(pwd)"

if [ -z "$1" ]; then

  echo "ERROR: The target parameter has not been provided"
  exit 1
fi

if [ -z "$2" ]; then

  echo "ERROR: The CMakeLists.txt directory path parameter has not been provided"
  exit 1
fi

if [ -z "$3" ]; then

  JUST_BUILD=false

else

  JUST_BUILD=$3
fi

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
  cd ApplicationGo && go build # TODO: <--- Implement
  #
  # if ! $JUST_BUILD; then rm -rf ./Build; else echo "Just building"; fi && \
  # if ! test -e Build; then mkdir Build; else echo "Build directory available"; fi && \
  # cd Build && \
  # . "$VERSION_SCRIPT" && cmake -GNinja -DVERSIONABLE_VERSION_PRIMARY="$VERSIONABLE_VERSION_PRIMARY" \
  # -DVERSIONABLE_VERSION_SECONDARY="$VERSIONABLE_VERSION_SECONDARY" -DVERSIONABLE_NAME="$VERSIONABLE_NAME" \
  # -DVERSIONABLE_VERSION_PATCH="$VERSIONABLE_VERSION_PATCH" -DVERSIONABLE_SNAPSHOT="$VERSIONABLE_SNAPSHOT" \
  # -DVERSIONABLE_HOMEPAGE="$VERSIONABLE_HOMEPAGE" -DVERSIONABLE_DESCRIPTION="$VERSIONABLE_DESCRIPTION" "$CMAKE_PATH" && \
  # ninja -j "$(nproc)" && \
  # echo "The '$VERSIONABLE_NAME' target has been compiled with success"
