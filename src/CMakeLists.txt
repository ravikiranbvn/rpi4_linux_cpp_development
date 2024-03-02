cmake_minimum_required(VERSION 2.8)

# use c++ 17
set(CMAKE_CXX_STANDARD 17)

# set project name
project( hello-world )

# set include directory
#include_directories( include )

# source files to compile
add_executable( hello-world
                helloworld.cpp)

target_link_libraries(hello-world -pthread)
