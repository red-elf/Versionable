#!/bin/bash

VERSION_SCRIPT="Version/version.sh"

if test -e "$VERSION_SCRIPT"; then

  # shellcheck disable=SC1090
  . "$VERSION_SCRIPT"
  printf "%s.%s" "$VERSIONABLE_VERSION_PRIMARY" "$VERSIONABLE_VERSION_SECONDARY"

  if [ -n "$VERSIONABLE_VERSION_PATCH" ]; then

    printf ".%s" "$VERSIONABLE_VERSION_PATCH"
  fi

  printf "\n"
else

  echo "ERROR: The '$VERSION_VERSION_SCRIPT' script not found"
fi