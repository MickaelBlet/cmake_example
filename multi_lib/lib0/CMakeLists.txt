cmake_minimum_required(VERSION 2.6)

set(PARENT_PROJECT_NAME library)

project("library0" CXX)

include_directories(
    "include"
)

file(GLOB SOURCES "src/*.cpp")

add_library("${PROJECT_NAME}" SHARED ${SOURCES})
target_compile_options("${PROJECT_NAME}"
    PRIVATE
        -pedantic
        -Wall
        -Wextra
        -Werror
)

set_target_properties("${PROJECT_NAME}"
    PROPERTIES
        CXX_STANDARD 98
        CXX_STANDARD_REQUIRED ON
        CXX_EXTENSIONS OFF
        NO_SYSTEM_FROM_IMPORTED ON
        PUBLIC_HEADER "include/example0.h"
        INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>;$<INSTALL_INTERFACE:include/${PROJECT_NAME}>"
)

# create package
# config
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
"include(\"\${CMAKE_CURRENT_LIST_DIR}/${PROJECT_NAME}Targets.cmake\")")

# target
install(TARGETS "${PROJECT_NAME}" EXPORT "${PROJECT_NAME}Targets"
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin
        PRIVATE_HEADER DESTINATION "include/${PROJECT_NAME}"
        PUBLIC_HEADER DESTINATION "include/${PROJECT_NAME}"
)
install(EXPORT "${PROJECT_NAME}Targets"
        FILE "${PROJECT_NAME}Targets.cmake"
        DESTINATION "lib/cmake/${PARENT_PROJECT_NAME}"
)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
        DESTINATION "lib/cmake/${PARENT_PROJECT_NAME}"
)
