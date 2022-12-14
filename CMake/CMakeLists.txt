cmake_minimum_required(VERSION 3.20)

set(VERSIONABLE_NAME ${VERSIONABLE_NAME})
set(VERSIONABLE_HOMEPAGE ${VERSIONABLE_HOMEPAGE})
set(VERSIONABLE_DESCRIPTION ${VERSIONABLE_DESCRIPTION})
set(VERSIONABLE_VERSION_PATCH ${VERSIONABLE_VERSION_PATCH})
set(VERSIONABLE_VERSION_PRIMARY ${VERSIONABLE_VERSION_PRIMARY})
set(VERSIONABLE_VERSION_SECONDARY ${VERSIONABLE_VERSION_SECONDARY})

set(
        VERSIONABLE_VERSION_NO_PATCH
        ${VERSIONABLE_VERSION_PRIMARY}.${VERSIONABLE_VERSION_SECONDARY}.${VERSIONABLE_VERSION_PATCH}
)

if ("${VERSIONABLE_SNAPSHOT}")

    set(VERSIONABLE_SNAPSHOT ${VERSIONABLE_SNAPSHOT})

    set(
            VERSIONABLE_VERSION
            ${VERSIONABLE_VERSION_NO_PATCH}-SNAPSHOT
    )

else ()

    set(VERSIONABLE_SNAPSHOT false)

    set(
            VERSIONABLE_VERSION
            ${VERSIONABLE_VERSION_NO_PATCH}

    )

endif ()

set(
        PROJECT_FULL_NAME
        ${VERSIONABLE_NAME}-${VERSIONABLE_VERSION}
)

project(
        ${PROJECT_FULL_NAME}
        VERSION ${VERSIONABLE_VERSION_NO_PATCH}
        HOMEPAGE_URL "${VERSIONABLE_HOMEPAGE}"
        DESCRIPTION "${VERSIONABLE_DESCRIPTION}"
        LANGUAGES CXX
)


message("Project: ${PROJECT_NAME}")

set(CMAKE_CXX_STANDARD 17)

if ("${VERSIONABLE_VERSION_EXECUTABLE}" MATCHES "ON")

    configure_file(${PROJECT_SOURCE_DIR}/../Versionable/Cpp/Version.cpp ${PROJECT_SOURCE_DIR} COPYONLY)
endif()

configure_file(${PROJECT_SOURCE_DIR}/../Versionable/Cpp/BuildConfig.h.in ${PROJECT_SOURCE_DIR} COPYONLY)
configure_file(${PROJECT_SOURCE_DIR}/../Versionable/Cpp/VersionInfo.h ${PROJECT_SOURCE_DIR} COPYONLY)
configure_file(${PROJECT_SOURCE_DIR}/../Versionable/Cpp/VersionInfo.cpp ${PROJECT_SOURCE_DIR} COPYONLY)

configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/BuildConfig.h.in"
        "${CMAKE_CURRENT_SOURCE_DIR}/BuildConfig.h"
)

include_directories("${PROJECT_BINARY_DIR}")

file(
        GLOB APP_SRC
        "*.h"
        "*.cpp"
)

if ("${VERSIONABLE_VERSION_EXECUTABLE}" MATCHES "ON")

    add_executable(Version ${APP_SRC})

    install(TARGETS Version DESTINATION bin/${PROJECT_NAME})
endif()
