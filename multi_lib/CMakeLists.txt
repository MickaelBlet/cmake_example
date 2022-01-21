cmake_minimum_required(VERSION 2.6)
project(library CXX)

add_subdirectory(lib0)
add_subdirectory(lib1)
add_subdirectory(test)

# create config package
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
"foreach(component \${${PROJECT_NAME}_FIND_COMPONENTS})
    include(\${CMAKE_CURRENT_LIST_DIR}/${PROJECT_NAME}\${component}Config.cmake)
endforeach()"
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    DESTINATION "lib/cmake/${PROJECT_NAME}"
)
