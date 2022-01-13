cmake_minimum_required(VERSION 2.6)
project(test_library CXX)

# list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../build/lib")
find_package(library REQUIRED COMPONENTS 0 1)# PATHS "${CMAKE_CURRENT_SOURCE_DIR}/../build/lib/cmake")

include_directories(
    "include"
)

file(GLOB SOURCES "src/*.cpp")

add_executable("${PROJECT_NAME}" ${SOURCES})

target_link_libraries("${PROJECT_NAME}" library0 library1)

set_target_properties("${PROJECT_NAME}"
    PROPERTIES
        CXX_STANDARD 98
        CXX_STANDARD_REQUIRED ON
        CXX_EXTENSIONS OFF
        NO_SYSTEM_FROM_IMPORTED ON
)