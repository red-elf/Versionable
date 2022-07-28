cmake_minimum_required(VERSION 3.22)
project(Versionable)

set(CMAKE_CXX_STANDARD 17)

set(VERSIONABLE_NAME ${VERSIONABLE_NAME})
set(VERSIONABLE_VERSION_PATCH ${VERSIONABLE_VERSION_PATCH})
set(VERSIONABLE_VERSION_PRIMARY ${VERSIONABLE_VERSION_PRIMARY})
set(VERSIONABLE_VERSION_SECONDARY ${VERSIONABLE_VERSION_SECONDARY})

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

add_executable(Version ${APP_SRC} "../../Versionable/Cpp/version.cpp")