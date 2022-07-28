#include <iostream>
#include <string>

#include "BuildConfig.h"

int main() {

    std::cout << std::to_string(VERSIONABLE_VERSION_PRIMARY) <<
        "." << std::to_string(VERSIONABLE_VERSION_SECONDARY) <<
        "." << std::to_string(VERSIONABLE_VERSION_PATCH) << std::endl;
    return 0;
}