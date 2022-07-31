#!/bin/bash

SEARCH_PATH="/usr/local/lib"
VERSION_SCRIPT="Version/version.sh"

if test -e "$VERSION_SCRIPT"; then

  # shellcheck disable=SC1090
  . "$VERSION_SCRIPT"

  if [ -z "$VERSIONABLE_NAME" ]; then

    echo "ERROR: The version name not set"
    exit 1
  fi

  for entry in "$SEARCH_PATH"/*; do

    FULL_ENTRY="$(echo "$entry" | grep "$VERSIONABLE_NAME")"

    if ! [[ "$FULL_ENTRY" = "" ]]; then

      echo "${FULL_ENTRY/"$SEARCH_PATH/"/}"
    fi
  done
fi
