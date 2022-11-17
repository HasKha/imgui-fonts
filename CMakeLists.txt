cmake_minimum_required(VERSION 3.15)

project(imgui-fonts)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(IconFontCppHeaders)

#
# in your code, first include this (with add_subdirectory or FetchContent_MakeAvailable)
#
# then call `fonts_add_font` for the fonts you want, e.g. fonts_add_font(fontawesome5)
#
# Then link to the font you want, e.g. `target_link_libraries(myapp PUBLIC fonts::fontawesome5)`
#

# save current path for later
set_property(GLOBAL PROPERTY __fonts_source_dir ${PROJECT_SOURCE_DIR})

function(fonts_add_font FONT_NAME)
    add_library(fonts_${FONT_NAME})
    add_library(fonts::${FONT_NAME} ALIAS fonts_${FONT_NAME})

    get_property(SOURCE_DIR GLOBAL PROPERTY __fonts_source_dir)
    target_include_directories(fonts_${FONT_NAME} PUBLIC 
        "${SOURCE_DIR}/include/")
    target_sources(fonts_${FONT_NAME} PRIVATE 
        "${SOURCE_DIR}/include/fonts/${FONT_NAME}.h" 
        "${SOURCE_DIR}/src/${FONT_NAME}.cpp")
    
    target_link_libraries(fonts_${FONT_NAME} INTERFACE juliettef::IconFontCppHeaders)
endfunction()

# Detects whether this is a top-level project
get_directory_property(HAS_PARENT PARENT_DIRECTORY)
if(NOT HAS_PARENT)
    # cmake generation started here, include imgui and generate the font_binary_to_compressed_c executable
    include(imgui)

    # also include all fonts
    fonts_add_font(fontawesome5)
    fonts_add_font(fontawesome6)
    fonts_add_font(source_sans_pro_regular)
endif()
