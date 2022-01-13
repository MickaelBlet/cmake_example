cmake_minimum_required(VERSION 2.6)
project(test CXX)

message("${CMAKE_CURRENT_SOURCE_DIR}/../build/lib/cmake")
find_package(library REQUIRED COMPONENTS 0 1 PATHS "${CMAKE_CURRENT_SOURCE_DIR}/../build/lib/cmake")

include_directories(
    "include"
)

file(GLOB SOURCES "src/*.cpp")

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} library0 library1)