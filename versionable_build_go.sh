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

VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  echo "Installing the '$VERSIONABLE_NAME' target, please wait" && \
  cd Application && go build && \
  echo "The '$VERSIONABLE_NAME' target has been made with success"
