#!/bin/bash

VERSION_SCRIPT="Version/version.sh"

if test -e "$VERSION_SCRIPT"; then

  # shellcheck disable=SC1090
  . "$VERSION_SCRIPT"

  if [ -z "$VERSIONABLE_VERSION_PRIMARY" ]; then

    echo "ERROR: The primary version number not set"
    exit 1
  fi

  if [ -z "$VERSIONABLE_VERSION_SECONDARY" ]; then

    echo "ERROR: The secondary version number not set"
    exit 1
  fi

  if [ -z "$VERSIONABLE_VERSION_PATCH" ]; then

    echo "ERROR: The patch version number not set"
    exit 1
  fi

  if [ -z "$VERSIONABLE_SNAPSHOT" ] || [[ "$VERSIONABLE_SNAPSHOT" = false ]]; then

    printf "%s.%s.%s\n" "$VERSIONABLE_VERSION_PRIMARY" "$VERSIONABLE_VERSION_SECONDARY" "$VERSIONABLE_VERSION_PATCH"
  else

    printf "%s.%s.%s-SNAPSHOT\n" "$VERSIONABLE_VERSION_PRIMARY" "$VERSIONABLE_VERSION_SECONDARY" "$VERSIONABLE_VERSION_PATCH"
  fi
else

  echo "ERROR: The '$VERSION_SCRIPT' script not found"
fi
