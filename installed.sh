#!/bin/bash

GET_INSTALLED_VERSION() {

  SEARCH_PATH="/usr/local/lib"

  if [ -n "$1" ]; then

    SEARCH_PATH="$1"
  fi

  VERSION_SCRIPT="Version/version.sh"
  INSTALLED_SCRIPT="Version/installed.sh"

  if test -e "$INSTALLED_SCRIPT"; then

    bash "$INSTALLED_SCRIPT"

  else

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

          echo "${FULL_ENTRY/"$SEARCH_PATH/$VERSIONABLE_NAME-"/}"
        fi
      done
    fi
  fi
}

LIB_VERSION="$(GET_INSTALLED_VERSION "/usr/local/lib")"

if [ -z "$LIB_VERSION" ]; then

  GET_INSTALLED_VERSION "/usr/local/bin"
else

  echo "$LIB_VERSION"
fi