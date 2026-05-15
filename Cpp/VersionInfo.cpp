//
// Created by milosvasic on 11.08.22.
//
#include "VersionInfo.h"
#include "BuildConfig.h"

const std::string getVersion() {

    std::string info = "";

    info.append(std::to_string(VERSIONABLE_VERSION_PRIMARY))
            .append(".")
            .append(std::to_string(VERSIONABLE_VERSION_SECONDARY))
            .append(".")
            .append(std::to_string(VERSIONABLE_VERSION_PATCH));

    if (VERSIONABLE_SNAPSHOT) {

        info.append("-SNAPSHOT");
    }
    return info;
}

const std::string getHomepage() {

    return VERSIONABLE_HOMEPAGE;
}

const std::string getDescription() {

    return VERSIONABLE_DESCRIPTION;
}