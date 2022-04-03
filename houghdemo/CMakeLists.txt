cmake_minimum_required(VERSION 3.21)
project(houghdemo)

set(CMAKE_CXX_STANDARD 14)

set(OpenCV_DIR "D:\\opencv\\mingw-build\\install")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

find_package(OpenCV REQUIRED)
    include_directories(${OPENCV_INCLUDE_DIRS})

add_executable(houghdemo main.cpp)

set(OPENCV_LIBS opencv_core opencv_imgproc opencv_highgui opencv_imgcodecs)

target_link_libraries(houghdemo ${OPENCV_LIBS})
