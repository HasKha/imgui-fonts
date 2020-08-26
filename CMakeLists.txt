cmake_minimum_required(VERSION 3.15)

project(imgui-fonts)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

if(CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    # cmake generation started here, include imgui and generate the font_binary_to_compressed_c executable
    include(imgui)
endif()

file(GLOB SOURCES "include/fonts/*.h" "src/*.c")

add_library(fonts)
add_library(imgui::fonts ALIAS fonts)

target_include_directories(fonts PUBLIC "include/")
target_sources(fonts PRIVATE ${SOURCES})

include(IconFontCppHeaders)
target_link_libraries(fonts PUBLIC juliettef::IconFontCppHeaders)
