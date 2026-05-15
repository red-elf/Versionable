#include <iostream>
#include <string>

#include "VersionInfo.h"

int main() {

    auto version = getVersion();

    std::cout << version << std::endl;
    return 0;
}