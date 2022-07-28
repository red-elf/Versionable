#!/bin/bash

VERSION_SCRIPT="Version/version.sh"

if test -e "$VERSION_SCRIPT"; then

  # shellcheck disable=SC1090
  . "$VERSION_SCRIPT"

  if [ -z "$VERSIONABLE_NAME" ]; then

    echo "ERROR: The version name not set"
    exit 1
  fi

  VERSION_EXECUTABLE=/usr/local/bin/"${VERSIONABLE_NAME}"_Version/"${VERSIONABLE_NAME}"_Version

  if test -e "$VERSION_EXECUTABLE"; then

    "$VERSION_EXECUTABLE"
  else

    echo "No version information available for the '${VERSIONABLE_NAME}'"
  fi
else

  echo "ERROR: The '$VERSION_SCRIPT' script not found"
fi
