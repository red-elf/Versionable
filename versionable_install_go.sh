#!/bin/bash

HERE="$(pwd)"
DIR_HOME=$(eval echo ~"$USER")
FILE_ZSH_RC="$DIR_HOME/.zshrc"
FILE_BASH_RC="$DIR_HOME/.bashrc"

if [ -z "$SUBMODULES_HOME" ]; then

  echo "ERROR: SUBMODULES_HOME not available"
  exit 1
fi

SCRIPT_PATHS="$SUBMODULES_HOME/Software-Toolkit/Utils/Sys/paths.sh"

if ! test -e "$SCRIPT_PATHS"; then

  echo "ERROR: Script not found '$SCRIPT_PATHS'"
  exit 1
fi

# shellcheck disable=SC1090
. "$SCRIPT_PATHS"

FILE_RC=""
    
if test -e "$FILE_ZSH_RC"; then

  FILE_RC="$FILE_ZSH_RC"

else

    if test -e "$FILE_BASH_RC"; then

      FILE_RC="$FILE_BASH_RC"

    else

      echo "ERROR: No '$FILE_ZSH_RC' or '$FILE_BASH_RC' found on the system"
      exit 1
    fi
fi

if [ -z "$1" ]; then

  echo "ERROR: The target parameter has not been provided"
  exit 1
fi

TARGET="$1"
VERSION_SCRIPT="$HERE/Version/version.sh"

if ! test -e "$VERSION_SCRIPT"; then

  echo "ERROR: The version script was not found at path: '$VERSION_SCRIPT'"
  exit 1
fi

# shellcheck disable=SC1090
. "$VERSION_SCRIPT" && \
  echo "Please provide your SUDO password in order to install the '$VERSIONABLE_NAME' target to your system" && \
  echo "WARNING: Not implemented installation for '$TARGET'"
  cd "$TARGET" && \
  ADD_TO_PATH "$FILE_RC" "$(pwd)" && \
  exec echo "The '$VERSIONABLE_NAME' target has been installed with success"
  # shellcheck disable=SC1090
  source "$FILE_RC" && \
  core --version
