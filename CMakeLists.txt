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

function(fonts_add_font FONT_NAME)
    add_library(fonts_${FONT_NAME})
    add_library(fonts::${FONT_NAME} ALIAS fonts_${FONT_NAME})

    # need full paths here to work in a function
    target_include_directories(fonts_${FONT_NAME} PUBLIC 
        "${PROJECT_SOURCE_DIR}/include/")
    target_sources(fonts_${FONT_NAME} PRIVATE 
        "${PROJECT_SOURCE_DIR}/include/fonts/${FONT_NAME}.h" 
        "${PROJECT_SOURCE_DIR}/src/${FONT_NAME}.cpp")
    
    target_link_libraries(fonts_${FONT_NAME} INTERFACE juliettef::IconFontCppHeaders)
endfunction()

if(CMAKE_SOURCE_DIR STREQUAL PROJECT_SOURCE_DIR)
    # cmake generation started here, include imgui and generate the font_binary_to_compressed_c executable
    include(imgui)

    # also include all fonts
    fonts_add_font(fontawesome5)
    fonts_add_font(fontawesome6)
    fonts_add_font(source_sans_pro_regular)
endif()
