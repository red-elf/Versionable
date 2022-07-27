# Versionable

Track the version of the software and the software components.

The following functionaliies provided:

- Obtain the current version of the project (the code repository)
- Obtain the installed version of the project
- Compare the installed and cloned repository versions
- Provide the mechanism for keeping the version at one central place and share with 3rd parties (CMake).

## How to use

- Clone the 'Versionable' in the root of the project as the git submodule under the 'Versionable' directory
- In the root of the project create a directory called 'Version'
- Inside the 'Version' directory define the mandatory shell scripts (see the next section)

## Mandatory shell scripts

The following scripts are mandatory:

- version.sh:
```shell
#!/bin/bash
export VERSIONABLE_NAME="NAME_OF_THE_VERSION"
export VERSIONABLE_VERSION_PRIMARY="1"
export VERSIONABLE_VERSION_SECONDARY="0"
export VERSIONABLE_VERSION_PATCH="0"
```
