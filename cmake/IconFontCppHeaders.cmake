if (TARGET IconFontCppHeaders)
    return()
endif()

include_guard()
include(FetchContent)

FetchContent_Declare(
    IconFontCppHeaders
    GIT_REPOSITORY https://github.com/juliettef/IconFontCppHeaders.git
    GIT_TAG 8cac2b5d9cfc566d3fa90bf6820a95e3c5ed5478
    )
FetchContent_MakeAvailable(IconFontCppHeaders)

add_library(IconFontCppHeaders INTERFACE)
add_library(juliettef::IconFontCppHeaders ALIAS IconFontCppHeaders)

target_include_directories(IconFontCppHeaders INTERFACE ${iconfontcppheaders_SOURCE_DIR})
