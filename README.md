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
export VERSIONABLE_NAME="NAME_OF_THE_VERSION" # Optional
export VERSIONABLE_VERSION_PRIMARY="1"
export VERSIONABLE_VERSION_SECONDARY="0"
export VERSIONABLE_VERSION_PATCH="0"          # Optional
```

## CMake integration

To integrate the version for your software follow the following steps:

Pass the values of the environment variables from the `version.sh` to the CMake script: 
```shell
source ../../Version/version.sh && \
  cmake -DVERSIONABLE_VERSION_PRIMARY=$VERSIONABLE_VERSION_PRIMARY \
  -DVERSIONABLE_VERSION_SECONDARY=$VERSIONABLE_VERSION_SECONDARY ..
```

*Note:* Paths to files and scripts of the example command depend on your project's directories setup.

In the `CMakeList.txt` use the provided values:

```cmake
set(VERSION_MAJOR ${VERSIONABLE_VERSION_PRIMARY})
set(VERSION_MINOR ${VERSIONABLE_VERSION_SECONDARY})

configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/YourLibrary.h.in"
        "${CMAKE_CURRENT_SOURCE_DIR}/YourLibrary.h"
)
```

*Note:* To support 'Versionable' you can include the [CMake snippet](CMake/CMakeLists.txt). Here is the example of the code: 

```cmake
cmake_minimum_required(VERSION 3.22)

include(${CMAKE_CURRENT_SOURCE_DIR}/../Versionable/CMake/CMakeLists.txt)
```

And use it in the header files:

- `YourLibrary.h`:

```c++
#define VERSION_MAJOR 1
#define VERSION_MINOR 0
```

- `YourLibrary.h.in`:

```c++
#define VERSION_MAJOR @VERSION_MAJOR@
#define VERSION_MINOR @VERSION_MINOR@
```

The version information is now available in your code (example):

```c++
#include "YourLibrary.h"

namespace YourLibrary::Info {

    static const std::string getVersion() {
        std::string majorVersion = std::to_string(VERSION_MAJOR);
        std::string minorVersion = std::to_string(VERSION_MINOR);
        return majorVersion + "." + minorVersion;
    }
}
```
